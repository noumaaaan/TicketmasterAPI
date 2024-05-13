//
//  TMSortingOption.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 12/05/2024.
//

import Foundation

enum TMEventSortingOption: String, CaseIterable {
    case relevance = "relevance,desc"
    case nameAsc = "name,asc"
    case nameDesc = "name,desc"
    case dateAsc = "date,asc"
    case dateDesc = "date,desc"
    
    var label: String {
        switch self {
        case .relevance: "Relevance"
        case .nameAsc: "Name ascending"
        case .nameDesc: "Name descending"
        case .dateAsc: "Date ascending"
        case .dateDesc: "Date descending"
        }
    }
}

enum TMVenueSortingOption: String, CaseIterable {
    case relevance = "relevance,desc"
    case nameAsc = "name,asc"
    case nameDesc = "name,desc"
    case random = "random"
    
    var label: String {
        switch self {
        case .relevance: "Relevance"
        case .nameAsc: "Name ascending"
        case .nameDesc: "Name descending"
        case .random: "Random"
        }
    }
}

enum TMAttractionSortingOption: String, CaseIterable {
    case relevance = "relevance,desc"
    case nameAsc = "name,asc"
    case nameDesc = "name,desc"
    case random = "random"
    
    var label: String {
        switch self {
        case .relevance: "Relevance"
        case .nameAsc: "Name ascending"
        case .nameDesc: "Name descending"
        case .random: "Random"
        }
    }
}
