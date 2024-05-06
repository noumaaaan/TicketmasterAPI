//
//  TMPriceRange.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

struct TMPriceRange: Codable, Hashable {
    let type: String
    let currency: String
    let min: Double
    let max: Double
}
