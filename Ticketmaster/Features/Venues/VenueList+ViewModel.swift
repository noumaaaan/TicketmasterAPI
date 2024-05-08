//
//  VenueList+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import Foundation

@MainActor
final class VenueListViewModel: ObservableObject {
    
    @Published var venues: [TMVenue] = []
    @Published var countryCode: TMCountryCode = .greatBritain
    @Published var error: Error?
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchVenues()
    }
    
    func fetchVenues(page: Int = 0) {
        Task {
            do {
                let result = try await APIService().fetchVenues(page: page)
                venues.append(contentsOf: result.embedded.venues)
                pageNumber = result.page.number
                maxPages = result.page.totalPages
            } catch {
                self.error = error
            }
        }
    }
    
    func getNextPage() {
        if pageNumber <= maxPages {
            pageNumber += 1
            fetchVenues(page: pageNumber)
        }
    }
    
    func refreshList() {
        venues.removeAll()
        fetchVenues()
    }
}
