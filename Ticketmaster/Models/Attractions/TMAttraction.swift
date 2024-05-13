//
//  TMAttraction.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

// MARK: - TMAttraction
struct TMAttraction: Codable, Hashable {
    let ID: String
    let name: String?
    let type: String
    let url: String?
    let images: [TMImage]?
    let classifications: [TMClassification]?
    let externalLinks: TMExternalLinks?
    let aliases: [String]?
    
    enum CodingKeys: String, CodingKey {
        case ID = "id"
        case name
        case type
        case url
        case images
        case classifications
        case externalLinks
        case aliases
    }
}

