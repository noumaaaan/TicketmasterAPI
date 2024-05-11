//
//  TMEventsContainer.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 10/05/2024.
//

import Foundation

// MARK: - TMEvents
struct TMEventsContainer: Codable, Hashable {
    let embedded: TMEmbedded?
    let links: TMLinks
    let page: TMPage

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - TMEmbedded
struct TMEmbedded: Codable, Hashable {
    let events: [TMEvent]
}
