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
    
    @Published var error: Error?
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchEvents()
    }
    
    func fetchEvents(page: Int = 0) {
        Task {
            do {
                let result = try await APIService().fetchEvents(
                    page: page,
                    countryCode: countryCode.rawValue,
                    sort: sortOption.rawValue,
                    segmentID: nil,
                    genreID: nil)
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
            fetchEvents(page: pageNumber)
        }
    }
    
    func refreshList() {
        self.events.removeAll()
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
