//
//  LoadingState.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 16/05/2024.
//

import Foundation

enum LoadingState: CaseIterable {
    case uninitialized
    case loaded
    case empty
    case error
}
