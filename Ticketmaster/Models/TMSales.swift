//
//  TMSales.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

struct TMSales: Codable, Hashable {
    let publicSales: PublicSales?
    let presales: [PreSales]?
    
    enum CodingKeys: String, CodingKey {
        case publicSales = "public"
        case presales
    }
}

struct PublicSales: Codable, Hashable {
    let startDateTime: String
    let startTBD: Bool
    let startTBA: Bool
    let endDateTime: String
}

struct PreSales: Codable, Hashable {
    let startDateTime: String
    let endDateTime: String
    let name: String
}
