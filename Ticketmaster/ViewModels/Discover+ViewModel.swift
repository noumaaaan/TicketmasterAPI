//
//  Discover+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import Foundation
import SwiftUI

@MainActor
final class DiscoverViewModel: ObservableObject {

    // Classifications
    @Published var sections: [TMSection] = []
    @Published var loadingState: LoadingState = .uninitialized
    @Published var totalResults: Int = 0
    @Published var error: Error?
    var pageNumber: Int = 0
    var maxPages: Int = 0
    
    init() {
        fetchClassifications()
    }
    
    // Classifications
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
}
