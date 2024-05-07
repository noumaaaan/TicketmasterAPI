//
//  TabOption.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import Foundation
import SwiftUI

enum TabOption: String, CaseIterable {
    case discover
    case attractions
    case venues
    case search
    case settings
    
    var image: String {
        switch self {
        case .discover: "globe.europe.africa"
        case .attractions: "person.3"
        case .venues: "building.columns"
        case .search: "magnifyingglass.circle"
        case .settings: "gearshape"
        }
    }
    
    var selected: String {
        image + ".fill"
    }
    
    var color: Color {
        switch self {
        case .discover:
            return .red
        case .attractions:
            return .indigo
        case .venues:
            return .orange
        case .search:
            return .blue
        case .settings:
            return .green
        }
    }
}
