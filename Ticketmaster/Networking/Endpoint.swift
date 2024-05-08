//
//  Endpoint.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

enum Endpoint {
    
    case fetchEvents
    case fetchEventDetails(eventID: String)
    case fetchClassifications
    
    case fetchVenues
    
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
        case .fetchEvents, .fetchEventDetails, .fetchClassifications, .fetchVenues:
            "GET"
        }
    }
    
    var path: String {
        switch self {
        case .fetchEvents:
            "/discovery/v2/events"
        case .fetchEventDetails(let eventID):
            "/discovery/v2/events/\(eventID)"
        case .fetchClassifications:
            "/discovery/v2/classifications"
        case .fetchVenues:
            "/discovery/v2/venues"
        }
    }
        
    var parameters: [URLQueryItem]? {
        var queryItems = [URLQueryItem]()
        
//        switch self {
//        case .fetchEvents:
//            queryItems.append(.init(name: "countryCode", value: TMCountryCode.greatBritain.rawValue))
//        default:
//            return nil
//        }
        
        
        queryItems.append(.init(name: "countryCode", value: TMCountryCode.greatBritain.rawValue))
        queryItems.append(.init(name: "apikey", value: Configuration().APIKEY))
        return queryItems
    }
}
