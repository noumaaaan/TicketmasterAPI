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
        case .fetchEvents, .fetchEventDetails:
            return "GET"
        }
    }
    
    var path: String {
        switch self {
        case .fetchEvents:
            return "/discovery/v2/events"
        case .fetchEventDetails(let eventID):
            return "/discovery/v2/events/\(eventID)"
        }
    }
        
    var parameters: [URLQueryItem]? {
        var queryItems = [URLQueryItem]()
        queryItems.append(.init(name: "apikey", value: Configuration().APIKEY))
        return queryItems
    }
}
