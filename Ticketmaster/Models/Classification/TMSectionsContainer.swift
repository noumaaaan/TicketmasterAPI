//
//  TMSectionsContainer.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

// MARK: - TMSectionsContainer
struct TMSectionsContainer: Codable, Hashable {
    let embedded: TMSections?
    let links: TMLinks
    let page: TMPage

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - TMSections
struct TMSections: Codable, Hashable {
    let classifications: [TMSection]
}
