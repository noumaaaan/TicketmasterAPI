//
//  TMPage.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

// MARK: - TMPage
struct TMPage: Codable, Hashable {
    let size: Int
    let totalElements: Int
    let totalPages: Int
    let number: Int
}
