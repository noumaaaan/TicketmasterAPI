//
//  TMEvent.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

struct TMEvent: Codable, Hashable {
    let ID: String
    let name: String
    let type: String
    let url: String
    let images: [TMImage]
    let sales: TMSales?
    let dates: TMDates?
    let classifications: [TMClassification]
    let promoter: TMPromoter?
    let priceRanges: [TMPriceRange]?
    let products: [TMProduct]?
    let seatmap: TMSeatmap
    let ticketLimit: TMTicketLimit?
    
    enum CodingKeys: String, CodingKey {
        case ID = "id"
        case name
        case type
        case url
        case images
        case sales
        case dates
        case classifications
        case promoter
        case priceRanges
        case products
        case seatmap
        case ticketLimit
    }
}










