//
//  TMAttractionsContainer.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

// MARK: - TMAttractionsContainer
struct TMAttractionsContainer: Codable, Hashable {
    let embedded: TMAttractions?
    let links: TMLinks
    let page: TMPage

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - TMEmbedded
struct TMAttractions: Codable, Hashable {
    let attractions: [TMAttraction]
}
