//
//  EventList+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

@MainActor
final class EventListViewModel: ObservableObject {

    @Published var events: [TMEvent] = []
    @Published var countryCode: TMCountryCode = Save().retrieveCountrySetting()
    @Published var sortOption: TMEventSortingOption = .relevance
    @Published var isSheetPresented: Bool = false
    @Published var loadingState: LoadingState = .uninitialized
    @Published var totalResults: Int = 0
    @Published var searchTerm: String = ""
    
    @Published var error: Error?
    
    @Published var isAlertPresented: Bool = false
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchEvents()
    }
    
    func fetchEvents() {
        Task {
            do {
                let result = try await APIService().fetchEvents(
                    page: pageNumber,
                    countryCode: countryCode == .worlwide ? nil : countryCode.rawValue,
                    sort: sortOption.rawValue,
                    segmentID: nil,
                    genreID: nil, 
                    search: searchTerm.isEmpty ? nil : searchTerm
                )
                if let embedded = result.embedded {
                    events.append(contentsOf: embedded.events)
                }
                pageNumber = result.page.number
                maxPages = result.page.totalPages
                totalResults = result.page.totalElements
                loadingState = events.count > 0 ? .loaded : .empty
                
                if self.totalResults == 0 && countryCode != .worlwide && !searchTerm.isEmpty {
                    isAlertPresented = true
                }
                
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
    
    func searchWorldwide() {
        isAlertPresented = false
        countryCode = .worlwide
        refreshList()
    }
}
