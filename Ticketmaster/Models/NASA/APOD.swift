//
//  APOD.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 16/05/2024.
//

import Foundation

struct APOD: Codable, Hashable {
    let copyright: String
    let date: String
    let explanation: String
    let title: String
    let url: String
}
