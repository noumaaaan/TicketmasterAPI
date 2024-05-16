//
//  Endpoint.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

enum Endpoint {
    case fetchEvents(page: Int, countryCode: String?, sortOption: String, segmentID: String?, genreID: String?, search: String?)
    case fetchAttractions(page: Int, sortOption: String?, genreID: String?)
    case fetchClassifications
    case fetchVenues(page: Int, countryCode: String, sortOption: String, genreID: String?)
}

extension Endpoint {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "app.ticketmaster.com"
    }
    
    var method: String {
        switch self {
        case .fetchEvents, .fetchClassifications, .fetchVenues, .fetchAttractions:
            "GET"
        }
    }
    
    var path: String {
        switch self {
        case .fetchEvents:
            "/discovery/v2/events"
        case .fetchClassifications:
            "/discovery/v2/classifications"
        case .fetchVenues:
            "/discovery/v2/venues"
        case .fetchAttractions:
            "/discovery/v2/attractions"
        }
    }
        
    var parameters: [URLQueryItem]? {
        var queryItems = [URLQueryItem]()
        queryItems.append(.init(name: "apikey", value: Configuration().APIKEY))
        
        switch self {
        case .fetchVenues(let page, let countryCode, let sortingOption, let genreID):
            queryItems.append(.init(name: "countryCode", value: countryCode))
            queryItems.append(.init(name: "sort", value: sortingOption))
            queryItems.append(.init(name: "page", value: String(page)))
            if let genreID = genreID { queryItems.append(.init(name: "genreId", value: genreID)) }
            
        case .fetchEvents(let page, let countryCode, let sortingOption, let segmentID, let genreID, let search):
            queryItems.append(.init(name: "page", value: String(page)))
            queryItems.append(.init(name: "sort", value: sortingOption))
            queryItems.append(.init(name: "size", value: String(10)))
            if let countryCode = countryCode { queryItems.append(.init(name: "countryCode", value: countryCode)) }
            if let segmentID = segmentID { queryItems.append(.init(name: "segmentId", value: segmentID)) }
            if let genreID = genreID { queryItems.append(.init(name: "genreId", value: genreID)) }
            if let search = search { queryItems.append(.init(name: "keyword", value: search)) }
            
        case .fetchAttractions(let page, let sortingOption, let genreID):
            queryItems.append(.init(name: "page", value: String(page)))
            queryItems.append(.init(name: "sort", value: sortingOption))
            if let genreID = genreID { queryItems.append(.init(name: "genreId", value: genreID)) }
            
        default: break
        }
        
        return queryItems
    }
}
