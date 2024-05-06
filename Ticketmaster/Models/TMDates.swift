//
//  TMDates.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

struct TMDates: Codable, Hashable {
    let start: StartDate
    let timezone: String
    let status: DateStatus
    let spanMultipleDays: Bool
}

struct StartDate: Codable, Hashable {
    let localDate: String
    let localTime: String
    let dateTime: String
}

struct DateStatus: Codable, Hashable {
    let code: String
}
