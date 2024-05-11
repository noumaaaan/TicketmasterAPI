//
//  TMVenue.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import Foundation

// MARK: - TMVenue
struct TMVenue: Codable, Hashable {
    let id: String
    let name: String
    let type: String
    let url: String?
    let postalCode: String?
    let timezone: String?
    let city: LocationDetails?
    let country: LocationDetails?
    let address: Address?
    let location: Location?
    let boxOfficeInfo: BoxOfficeInfo?
    let parkingDetail: String?
    let accessibleSeatingDetail: String?
    let images: [VenueImage]?
}

// MARK: - LocationDetails
struct LocationDetails: Codable, Hashable {
    let name: String?
}

// MARK: - Address
struct Address: Codable, Hashable {
    let line1: String?
    let line2: String?
}

// MARK: - Location
struct Location: Codable, Hashable {
    let longitude: String?
    let latitude: String?
}

// MARK: - BoxOfficeInfo
struct BoxOfficeInfo: Codable, Hashable {
    let phoneNumberDetail: String?
    let openHoursDetail: String?
    let acceptedPaymentDetail: String?
    let willCallDetail: String?
}

// MARK: - Image
struct VenueImage: Codable, Hashable {
    let url: String?
    let width: Int?
    let height: Int?
}
