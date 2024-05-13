//
//  DiscoverList+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

@MainActor
final class DiscoverListViewModel: ObservableObject {

    @Published var classifications: [TMSection] = []
    @Published var error: Error?
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchClassifications()
    }
    
    func fetchClassifications() {
        Task {
            do {
                let result = try await APIService().fetchClassifications()
                if let embedded = result.embedded {
                    classifications.append(contentsOf: embedded.classifications)
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
            fetchClassifications()
        }
    }
    
    func refreshList() {
        self.classifications.removeAll()
        fetchClassifications()
    }
}
