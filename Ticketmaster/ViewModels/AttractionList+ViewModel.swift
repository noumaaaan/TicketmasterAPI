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
    @Published var sortOption: TMAttractionSortingOption = .relevance
    @Published var loadingState: LoadingState = .uninitialized
    @Published var totalResults: Int = 0
    @Published var searchTerm: String = ""
    
    @Published var error: Error?
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchAttractions()
    }
    
    func fetchAttractions() {
        Task {
            do {
                let result = try await APIService().fetchAttractions(
                    page: pageNumber,
                    sort: sortOption.rawValue,
                    genreID: nil,
                    search: searchTerm.isEmpty ? nil : searchTerm
                )
                if let embedded = result.embedded {
                    attractions.append(contentsOf: embedded.attractions)
                }
                pageNumber = result.page.number
                maxPages = result.page.totalPages
                totalResults = result.page.totalElements
                loadingState = attractions.count > 0 ? .loaded : .empty
                
            } catch {
                self.error = error
                self.loadingState = .error
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
        self.pageNumber = 0
        fetchAttractions()
    }
    
    func getSorted(option: TMAttractionSortingOption) {
        self.sortOption = option
        refreshList()
    }
}
