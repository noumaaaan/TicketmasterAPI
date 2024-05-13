//
//  TMExternalLinks.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

// MARK: - ExternalLinks
struct TMExternalLinks: Codable, Hashable {
    let youtube: [ExternalLinkItem]?
    let twitter: [ExternalLinkItem]?
    let wiki: [ExternalLinkItem]?
    let facebook: [ExternalLinkItem]?
    let spotify: [ExternalLinkItem]?
    let instagram: [ExternalLinkItem]?
}

// MARK: - ExternalLinkItem
struct ExternalLinkItem: Codable, Hashable {
    let url: String?
}
