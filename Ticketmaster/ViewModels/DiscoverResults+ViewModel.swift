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
    
    @Published var selectedSegmentID: String?
    
    @Published var error: Error?
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    func setSelectedSection(section: TMSection) {
        // Check ID is not nil
        if let segmentID = selectedSegmentID {
            // Check if its the same
            if segmentID == section.segment?.ID {
            } else {
                // if its not, set new id and fetch
                selectedSegmentID = section.segment?.ID
                fetchEvents()
            }
        } else {
            
            selectedSegmentID = section.segment?.ID
            fetchEvents()
        }
    }
    
    func setSelected(section: TMSection) {
        let proposed = section.segment?.ID
        
        if proposed != selectedSegmentID {
            selectedSegmentID = proposed
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
                    segmentID: selectedSegmentID,
                    genreID: nil,
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
//            fetchEvents()
        }
    }
    
    func refreshList() {
        self.events.removeAll()
        self.pageNumber = 0
//        fetchEvents()
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

