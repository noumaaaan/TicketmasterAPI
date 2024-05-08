//
//  TMClassifications.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 07/05/2024.
//

import Foundation

// MARK: - TMClassifications
struct TMClassifications: Codable, Hashable {
    let embedded: TMClassificationsEmbedded
    let links: Links
    let page: Page

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - TMClassificationsEmbedded
struct TMClassificationsEmbedded: Codable, Hashable {
    let classifications: [Classification]
}

// MARK: - Classification
struct Classification: Codable, Hashable {
    let family: Bool
    let links: Links
    let segment: Segment?
    let type: TypeClass?

    enum CodingKeys: String, CodingKey {
        case family
        case links = "_links"
        case segment, type
    }
}

// MARK: - Links
struct Links: Codable, Hashable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - SelfClass
struct SelfClass: Codable, Hashable {
    let href: String
}

// MARK: - Segment
struct Segment: Codable, Hashable {
    let id, name: String
    let locale: Locale
    let primaryID: String
    let links: Links
    let embedded: SegmentEmbedded

    enum CodingKeys: String, CodingKey {
        case id, name, locale
        case primaryID = "primaryId"
        case links = "_links"
        case embedded = "_embedded"
    }
}

// MARK: - SegmentEmbedded
struct SegmentEmbedded: Codable, Hashable {
    let genres: [Genre]
}

// MARK: - GenreEmbedded
struct GenreEmbedded: Codable, Hashable {
    let subgenres: [Genre]
}

// MARK: - Genre
struct Genre: Codable, Hashable {
    let id, name: String
    let locale: Locale
    let links: Links
    let embedded: GenreEmbedded?

    enum CodingKeys: String, CodingKey {
        case id, name, locale
        case links = "_links"
        case embedded = "_embedded"
    }
}

enum Locale: String, Codable {
    case enUs = "en-us"
}

// MARK: - TypeClass
struct TypeClass: Codable, Hashable {
    let id, name: String
    let locale: Locale
    let primaryID: String
    let links: Links
    let embedded: TypeEmbedded

    enum CodingKeys: String, CodingKey {
        case id, name, locale
        case primaryID = "primaryId"
        case links = "_links"
        case embedded = "_embedded"
    }
}

// MARK: - TypeEmbedded
struct TypeEmbedded: Codable, Hashable {
    let subtypes: [Genre]
}

// MARK: - Page
struct Page: Codable, Hashable {
    let size, totalElements, totalPages, number: Int
}
