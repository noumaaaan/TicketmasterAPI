//
//  EventList+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

enum SortingOption: String, CaseIterable {
    case relevance = "relevance,desc"
    case nameAsc = "name,asc"
    case nameDesc = "name,desc"
    case dateAsc = "date,asc"
    case dateDesc = "date,desc"
    
    var label: String {
        switch self {
        case .relevance: "Relevance"
        case .nameAsc: "Name ascending"
        case .nameDesc: "Name descending"
        case .dateAsc: "Date ascending"
        case .dateDesc: "Date descending"
        }
    }
}

@MainActor
final class EventListViewModel: ObservableObject {

    @Published var events: [TMEvent] = []
    @Published var countryCode: TMCountryCode = .greatBritain
    @Published var sortOption: SortingOption = .relevance
    
    @Published var error: Error?
    
    @Published var isSheetPresented: Bool = false
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchEvents()
    }
    
    func fetchEvents(page: Int = 0) {
        Task {
            do {
                let result = try await APIService().fetchEvents(page: page, countryCode: countryCode.rawValue, sort: sortOption.rawValue)
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
    
    func getSorted(option: SortingOption) {
        self.sortOption = option
        refreshList()
    }
    
    func changeCountryCode(code: TMCountryCode) {
        if code == countryCode {
            isSheetPresented = false
        } else {
            countryCode = code
            isSheetPresented = false
            refreshList()
        }
    }
}
