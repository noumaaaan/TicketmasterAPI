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
    @Published var countryCode: TMCountryCode = .greatBritain
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
                let result = try await APIService().fetchEvents(page: page, countryCode: countryCode.rawValue)
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
