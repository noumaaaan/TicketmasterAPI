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
    @Published var isSheetPresented: Bool = false
    @Published var loadingState: LoadingState = .uninitialized
    @Published var totalResults: Int = 0
    @Published var searchTerm: String = ""
    
    @Published var error: Error?
    
    @Published var isAlertPresented: Bool = false
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchVenues()
    }
    
    func fetchVenues() {
        Task {
            do {
                let result = try await APIService().fetchVenues(
                    page: pageNumber,
                    countryCode: countryCode.rawValue,
                    sort: sortOption.rawValue,
                    genreID: nil,
                    search: searchTerm.isEmpty ? nil : searchTerm
                )
                if let embedded = result.embedded {
                    venues.append(contentsOf: embedded.venues)
                }
                pageNumber = result.page.number
                maxPages = result.page.totalPages
                totalResults = result.page.totalElements
                loadingState = venues.count > 0 ? .loaded : .empty
                
                if self.totalResults == 0 && countryCode != .worlwide && !searchTerm.isEmpty {
                    isAlertPresented = true
                }
                
            } catch {
                print(error)
                self.error = error
            }
        }
    }
    
    func getNextPage() {
        if pageNumber <= maxPages {
            pageNumber += 1
            fetchVenues()
        }
    }
    
    func refreshList() {
        self.venues.removeAll()
        self.pageNumber = 0
        fetchVenues()
    }
    
    func getSorted(option: TMVenueSortingOption) {
        self.sortOption = option
        refreshList()
    }
    
    func changeCountryCode(code: TMCountryCode) {
        if code == countryCode {
            isSheetPresented = false
        } else {
            countryCode = code
            isSheetPresented = false
            Save().saveCountrySetting(country: code)
            refreshList()
        }
    }
    
    func searchWorldwide() {
        isAlertPresented = false
        countryCode = .worlwide
        refreshList()
    }
}
