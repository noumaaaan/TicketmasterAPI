//
//  DiscoverResults+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

@MainActor
final class DiscoverResultsViewModel: ObservableObject {

    @Published var events: [TMEvent] = []
    @Published var attractions: [TMAttraction] = []
    @Published var venues: [TMVenue] = []
    @Published var error: Error?
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
//        fetchResults()
    }
    
}

