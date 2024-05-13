//
//  TMSocialMedia.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

enum TMSocialMedia: String, CaseIterable {
    
    case facebook = "facebook"
    case wiki = "wiki"
    case instagram = "instagram"
    case spotify = "spotify"
    case youtube = "youtube"
    case twitter = "twitter"

    var image: String {
        switch self {
        case .facebook: "facebook"
        case .wiki: "wikipedia"
        case .instagram: "instagram"
        case .spotify: "spotify"
        case .youtube: "youtube"
        case .twitter: "twitter"
        }
    }
}
