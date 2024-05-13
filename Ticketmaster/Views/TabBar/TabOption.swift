//
//  TabOption.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import Foundation
import SwiftUI

enum TabOption: String, CaseIterable {
    case events
    case attractions
    case discover
    case venues
    case settings
    
    var image: String {
        switch self {
        case .events: "note"
        case .attractions: "person.3"
        case .discover: "globe.europe.africa"
        case .venues: "building.columns"
        case .settings: "gearshape"
        }
    }
    
    var selected: String {
        switch self {
        case .events: "note.text"
        default: image + ".fill"
        }
    }
    
    var color: Color {
        switch self {
        case .events:
            return Color.init(hex: "49FF00")
        case .attractions:
            return Color.init(hex: "2FA4FF")
        case .discover:
            return Color.init(hex: "FF204E")
        case .venues:
            return Color.init(hex: "FFE400")
        case .settings:
            return Color.init(hex: "F72798")
        }
    }
}
