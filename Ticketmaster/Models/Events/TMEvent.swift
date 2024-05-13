//
//  TMEvent.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

// MARK: - TMEvent
struct TMEvent: Codable, Hashable {
    let ID: String
    let name: String?
    let type: String
    let url: String?
    let images: [TMImage]?
    let sales: TMSales?
    let dates: TMDates?
    let classifications: [TMClassification]?
    let promoter: TMPromoter?
    let priceRanges: [TMPriceRange]?
    let products: [TMProduct]?
    let seatmap: TMSeatmap?
    let ticketLimit: TMTicketLimit?
    let embedded: TMEmbeddedEvent?
    
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
        case embedded = "_embedded"
    }
}

// MARK: - TMSales
struct TMSales: Codable, Hashable {
    let publicSales: PublicSales?
    let presales: [PreSales]?
    
    enum CodingKeys: String, CodingKey {
        case publicSales = "public"
        case presales
    }
}

struct PublicSales: Codable, Hashable {
    let startDateTime: String?
    let endDateTime: String?
}

struct PreSales: Codable, Hashable {
    let startDateTime: String?
    let endDateTime: String?
    let name: String?
}

// MARK: - TMDates
struct TMDates: Codable, Hashable {
    let start: StartDate?
    let timezone: String?
    let status: DateStatus?
    let spanMultipleDays: Bool?
}

struct StartDate: Codable, Hashable {
    let localDate: String?
    let localTime: String?
    let dateTime: String?
}

struct DateStatus: Codable, Hashable {
    let code: String?
}

// MARK: - TMPromoter
struct TMPromoter: Codable, Hashable {
    let name: String?
    let description: String?
}

// MARK: - TMPriceRange
struct TMPriceRange: Codable, Hashable {
    let type: String?
    let currency: String?
    let min: Double?
    let max: Double?
}

// MARK: - TMProduct
struct TMProduct: Codable, Hashable {
    let name: String?
    let url: String?
    let classifications: [TMClassification]?
}

// MARK: - TMSeatmap
struct TMSeatmap: Codable, Hashable {
    let staticUrl: String?
}

// MARK: - TMTicketLimit
struct TMTicketLimit: Codable, Hashable {
    let info: String?
}

// MARK: - TMEmbeddedEvent
struct TMEmbeddedEvent: Codable, Hashable {
    let venues: [TMVenue]?
}
