//
//  TMCountryCode.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

enum TMCountryCode: String, CaseIterable {
    case argentina = "AR"
    case australia = "AU"
    case belgium = "BE"
    case brazil = "BR"
    case canada = "CA"
    case china = "CN"
    case colombia = "CO"
    case czech = "CZ"
    case denmark = "DK"
    case finland = "FI"
    case france = "FR"
    case germany = "DE"
    case greece = "GR"
    case india = "IN"
    case italy = "IT"
    case japan = "JP"
    case malaysia = "MY"
    case mexico = "MX"
    case netherlands = "NL"
    case portugal = "PT"
    case russia = "RU"
    case spain = "ES"
    case sweden = "SE"
    case switzerland = "CH"
    case turkey = "TR"
    case uae = "ae"
    case unitedKingdom = "GB"
    case unitedStates = "US"
        
    var label: String {
        switch self {
        case .argentina: "Argentina"
        case .australia: "Australia"
        case .belgium: "Belgium"
        case .brazil: "Brazil"
        case .canada: "Canada"
        case .china: "China"
        case .colombia: "Colombia"
        case .czech: "Czech Republic"
        case .denmark: "Denmark"
        case .finland: "Finland"
        case .france: "France"
        case .greece: "Greece"
        case .germany: "Germany"
        case .india: "India"
        case .italy: "Italy"
        case .japan: "Japan"
        case .malaysia: "Malaysia"
        case .mexico: "Mexico"
        case .netherlands: "Netherlands"
        case .portugal: "Portugal"
        case .russia: "Russia"
        case .spain: "Spain"
        case .sweden: "Sweden"
        case .switzerland: "Switzerland"
        case .turkey: "Turkey"
        case .uae: "UAE"
        case .unitedKingdom: "United Kingdom"
        case .unitedStates: "USA"
        }
    }
    
    var flag: String {
        switch self {
        case .argentina: "🇦🇷"
        case .australia: "🇦🇺"
        case .belgium: "🇧🇪"
        case .brazil: "🇧🇷"
        case .canada: "🇨🇦"
        case .china: "🇨🇳"
        case .colombia: "🇨🇴"
        case .czech: "🇨🇿"
        case .denmark: "🇩🇰"
        case .finland: "🇫🇮"
        case .france: "🇫🇷"
        case .germany: "🇩🇪"
        case .greece: "🇬🇷"
        case .india: "🇮🇳"
        case .italy: "🇮🇹"
        case .japan: "🇯🇵"
        case .malaysia: "🇲🇾"
        case .mexico: "🇲🇽"
        case .netherlands: "🇳🇱"
        case .portugal: "🇵🇹"
        case .russia: "🇷🇺"
        case .spain: "🇪🇸"
        case .sweden: "🇸🇪"
        case .switzerland: "🇨🇭"
        case .turkey: "🇹🇷"
        case .uae: "🇦🇪"
        case .unitedKingdom: "🇬🇧"
        case .unitedStates: "🇺🇸"
        }
    }
}
