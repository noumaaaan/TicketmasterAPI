//
//  TMEventsContainer.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 10/05/2024.
//

import Foundation

// MARK: - TMEvents
struct TMEventsContainer: Codable, Hashable {
    let embedded: TMEvents?
    let links: TMLinks
    let page: TMPage

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - TMEmbedded
struct TMEvents: Codable, Hashable {
    let events: [TMEvent]
}
