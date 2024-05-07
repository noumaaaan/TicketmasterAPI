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
        case .fetchEvents, .fetchEventDetails, .fetchClassifications:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .fetchEvents:
            return "/discovery/v2/events"
        case .fetchEventDetails(let eventID):
            return "/discovery/v2/events/\(eventID)"
        case .fetchClassifications:
            return "/discovery/v2/classifications"
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
        queryItems.append(.init(name: "apikey", value: Configuration().APIKEY))
        return queryItems
    }
}
