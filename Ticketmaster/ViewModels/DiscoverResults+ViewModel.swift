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
    @Published var error: Error?
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    func fetchGenreEvents(genreID: String) {
        Task {
            do {
                events.removeAll()
                let result = try await APIService().fetchEvents(page: 0, countryCode: "gb", sort: "relevance,desc", genreID: genreID)
                if let embedded = result.embedded {
                    events.append(contentsOf: embedded.events)
                }
                pageNumber = result.page.number
                maxPages = result.page.totalPages
            } catch {
                print(error)
                self.error = error
            }
        }
    }
}

