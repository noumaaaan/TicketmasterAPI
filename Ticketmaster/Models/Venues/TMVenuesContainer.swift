//
//  TMVenue.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import Foundation

// MARK: - TMVenues
struct TMVenuesContainer: Codable, Hashable {
    let embedded: TMVenues?
    let links: TMLinks
    let page: TMPage

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - TMVenues
struct TMVenues: Codable, Hashable {
    let venues: [TMVenue]
}
