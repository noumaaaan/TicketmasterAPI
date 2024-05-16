//
//  Discover+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation

@MainActor
final class DiscoverViewModel: ObservableObject {

    @Published var sections: [TMSection] = []
    @Published var loadingState: LoadingState = .uninitialized
    @Published var totalResults: Int = 0
    
    @Published var selectedSegmentID: String?
    @Published var error: Error?
    
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchClassifications()
    }
    
    func transferSegment(section: TMSection) {
        self.selectedSegmentID = section.segment?.ID
        print(selectedSegmentID)
    }
    
    func fetchClassifications() {
        Task {
            do {
                let result = try await APIService().fetchClassifications()
                if let embedded = result.embedded {
                    sections.append(contentsOf: embedded.classifications.filter { $0.segment != nil })
                }
                pageNumber = result.page.number
                maxPages = result.page.totalPages
                totalResults = sections.count
                loadingState = sections.count > 0 ? .loaded : .empty
                
            } catch {
                self.error = error
                self.loadingState = .error
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
        self.sections.removeAll()
        self.pageNumber = 0
        fetchClassifications()
    }
}
