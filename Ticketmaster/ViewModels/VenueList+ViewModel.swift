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
    @Published var countryCode: TMCountryCode = Save().retrieveCountrySetting()
    @Published var sortOption: TMVenueSortingOption = .relevance
    @Published var error: Error?
    
    @Published var isSheetPresented: Bool = false
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchVenues()
    }
    
    func fetchVenues(page: Int = 0) {
        Task {
            do {
                let result = try await APIService().fetchVenues(page: page, countryCode: countryCode.rawValue, sort: sortOption.rawValue, genreID: nil)
                if let embedded = result.embedded {
                    venues.append(contentsOf: embedded.venues)
                }
                pageNumber = result.page.number
                maxPages = result.page.totalPages
            } catch {
                print(error)
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
        self.venues.removeAll()
        fetchVenues()
    }
    
    func changeCountryCode(code: TMCountryCode) {
        if code == countryCode {
            isSheetPresented = false
        } else {
            countryCode = code
            isSheetPresented = false
            refreshList()
            Save().saveCountrySetting(country: code)
        }
    }
    
    func getSorted(option: TMVenueSortingOption) {
        self.sortOption = option
        refreshList()
    }
}
