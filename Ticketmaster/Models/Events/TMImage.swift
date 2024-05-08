//
//  TMImage.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

struct TMImage: Codable, Hashable {
    let ratio: String
    let url: String
    let width: Int
    let height: Int
}
