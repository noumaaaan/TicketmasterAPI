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
    @Published var countryCode: TMCountryCode = Save().retrieveCountrySetting()
    @Published var sortOption: TMEventSortingOption = .relevance
    @Published var isSheetPresented: Bool = false
    @Published var loadingState: LoadingState = .uninitialized
    @Published var totalResults: Int = 0
    
    @Published var selectedGenre: TMGenre?
    
    @Published var error: Error?
    
    var errorDescription: String {
        if let name = selectedGenre?.name {
            return "No events found for \(name) in \(countryCode.label)."
        } else {
            return "No events found in \(countryCode.label)"
        }
    }
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    func setSelected(genre: TMGenre) {
        if genre != selectedGenre {
            selectedGenre = genre
            fetchEvents()
        }
    }
    
    func fetchEvents() {
        Task {
            do {
                let result = try await APIService().fetchEvents(
                    page: pageNumber,
                    countryCode: countryCode == .worlwide ? nil : countryCode.rawValue,
                    sort: sortOption.rawValue,
                    genreID: selectedGenre?.ID,
                    search: nil
                )
                if let embedded = result.embedded {
                    events.append(contentsOf: embedded.events)
                }
                pageNumber = result.page.number
                maxPages = result.page.totalPages
                totalResults = result.page.totalElements
                loadingState = events.count > 0 ? .loaded : .empty
                
            } catch {
                self.error = error
                self.loadingState = .error
            }
        }
    }
    
    func getNextPage() {
        if pageNumber <= maxPages {
            pageNumber += 1
            fetchEvents()
        }
    }
    
    func refreshList() {
        self.events.removeAll()
        self.pageNumber = 0
        fetchEvents()
    }
    
    func getSorted(option: TMEventSortingOption) {
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
}

