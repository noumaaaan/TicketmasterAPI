//
//  TMClassification.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

// MARK: - TMClassification
struct TMClassification: Codable, Hashable {
    let segment: ClassificationSubType?
    let genre: ClassificationSubType?
    let subGenre: ClassificationSubType?
    let type: ClassificationSubType?
    let subType: ClassificationSubType?
}

struct ClassificationSubType: Codable, Hashable {
    let name: String?
}
