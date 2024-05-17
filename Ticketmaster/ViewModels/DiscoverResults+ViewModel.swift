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
    
    @Published var selectedGenreID: String?
    @Published var isSheetPresented: Bool = false
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
        
    
    func updateGenre(genreID: String?, segmentID: String?) {
        if selectedGenreID == genreID {
            selectedGenreID = nil
        } else {
            selectedGenreID = genreID
        }
        isSheetPresented = false
        
        if selectedGenreID != nil {
            fetchEvents(segmentID: nil, genreID: selectedGenreID)
        } else {
            fetchEvents(segmentID: segmentID, genreID: nil)
        }
    }
    
    func fetchEvents(segmentID: String?, genreID: String?) {
        Task {
            do {
                events.removeAll()
                let result = try await APIService().fetchEvents(page: pageNumber, countryCode: "gb", sort: "relevance,desc", segmentID: segmentID, genreID: genreID, search: nil)
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

