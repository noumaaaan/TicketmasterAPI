//
//  Helpers.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 11/05/2024.
//

import Foundation

let isoFormatter: ISO8601DateFormatter = {
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = .withInternetDateTime
    return dateFormatter
}()

let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE d MMMM yyyy, h:mm a"
    return dateFormatter
}()

func formattedDate(date: String) -> String {
    if let formatted = isoFormatter.date(from: date) {
        return dateFormatter.string(from: formatted)
    } else {
        return ""
    }
}
