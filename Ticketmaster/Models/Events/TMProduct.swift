//
//  TMProduct.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

struct TMProduct: Codable, Hashable {
    let name: String
    let url: String
    let classifications: [TMClassification]
}
