//
//  TMSection.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

// MARK: - TMSection
struct TMSection: Codable, Hashable {
    let segment: TMSegment?
}

// MARK: - TMSegment
struct TMSegment: Codable, Hashable {
    let ID: String
    let name: String?
    let embedded: TMEmbeddedSection?
    
    enum CodingKeys: String, CodingKey {
        case ID = "id"
        case name
        case embedded = "_embedded"
    }
}

// MARK: - TMEmbeddedSection
struct TMEmbeddedSection: Codable, Hashable {
    let genres: [TMGenre]?
}

// MARK: - TMGenre
struct TMGenre: Codable, Hashable {
    let ID: String
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case ID = "id"
        case name
    }
}
