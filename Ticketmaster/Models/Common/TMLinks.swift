//
//  TMLinks.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

// MARK: - TMLinks
struct TMLinks: Codable, Hashable {
    let first, link, next, last: LinkObject?
    
    enum CodingKeys: String, CodingKey {
        case first
        case link = "self"
        case next
        case last
    }
}

struct LinkObject: Codable, Hashable {
    let href: String
}
