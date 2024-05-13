//
//  AttractionList+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

@MainActor
final class AttractionListViewModel: ObservableObject {

    @Published var attractions: [TMAttraction] = []
    @Published var error: Error?
    @Published var sortOption: TMAttractionSortingOption = .relevance
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchAttractions()
    }
    
    func fetchAttractions() {
        Task {
            do {
                let result = try await APIService().fetchAttractions(page: pageNumber, sort: sortOption.rawValue)
                if let embedded = result.embedded {
                    attractions.append(contentsOf: embedded.attractions)
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
            fetchAttractions()
        }
    }
    
    func refreshList() {
        self.attractions.removeAll()
        fetchAttractions()
    }
    
    func getSorted(option: TMAttractionSortingOption) {
        self.sortOption = option
        refreshList()
    }
}
