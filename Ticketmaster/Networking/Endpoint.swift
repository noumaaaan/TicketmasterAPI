//
//  Endpoint.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

enum Endpoint {
    
    case fetchVenues(page: Int, countryCode: String, sortOption: String)
    case fetchEvents(page: Int, countryCode: String, sortOption: String)
    case fetchAttractions(page: Int, sortOption: String)
    
    case fetchClassifications
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
        case .fetchVenues(let page, let countryCode, let sortingOption):
            queryItems.append(.init(name: "countryCode", value: countryCode))
            queryItems.append(.init(name: "sort", value: sortingOption))
            queryItems.append(.init(name: "page", value: String(page)))
            
        case .fetchEvents(let page, let countryCode, let sortingOption):
            queryItems.append(.init(name: "page", value: String(page)))
            queryItems.append(.init(name: "sort", value: sortingOption))
            queryItems.append(.init(name: "countryCode", value: countryCode))
            
        case .fetchAttractions(let page, let sortingOption):
            queryItems.append(.init(name: "page", value: String(page)))
            queryItems.append(.init(name: "sort", value: sortingOption))
            
        default:
            return nil
        }
        
        return queryItems
    }
}
