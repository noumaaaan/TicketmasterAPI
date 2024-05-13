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
    case events
    case attractions
    case venues
    case settings
    
    var image: String {
        switch self {
        case .discover: "globe.europe.africa"
        case .events: "note"
        case .attractions: "person.3"
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
        case .discover:
            return Color.init(hex: "FF204E")
        case .events:
            return Color.init(hex: "FFE400")
        case .attractions:
            return Color.init(hex: "F72798")
        case .venues:
            return Color.init(hex: "49FF00")
        case .settings:
            return Color.init(hex: "2FA4FF")
        }
    }
}
