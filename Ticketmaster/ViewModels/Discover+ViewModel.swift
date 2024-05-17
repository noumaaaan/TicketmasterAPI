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
    @Published var classLoadingState: LoadingState = .uninitialized
    @Published var classTotalResults: Int = 0
    @Published var classError: Error?
    @Published var selectedSegmentID: String? {
        didSet {
            events.removeAll()
        }
    }
    var classPageNumber: Int = 0
    var classMaxPages: Int = 0
    
    // Events
    @Published var events: [TMEvent] = []
    @Published var eventCountryCode: TMCountryCode = Save().retrieveCountrySetting()
    @Published var eventSortOption: TMEventSortingOption = .relevance
    @Published var eventIsSheetPresented: Bool = false
    @Published var eventLoadingState: LoadingState = .uninitialized
    @Published var eventTotalResults: Int = 0
    @Published var eventError: Error?
    var eventPageNumber: Int = 0
    var eventMaxPages: Int = 0
    
    init() {
        fetchClassifications()
    }
    
    func selectSegment(section: TMSection) {
        selectedSegmentID = section.segment?.ID
        fetchEvents()
    }
    
    // Classifications
    func fetchClassifications() {
        Task {
            do {
                let result = try await APIService().fetchClassifications()
                if let embedded = result.embedded {
                    sections.append(contentsOf: embedded.classifications.filter { $0.segment != nil })
                }
                classPageNumber = result.page.number
                classMaxPages = result.page.totalPages
                classTotalResults = sections.count
                classLoadingState = sections.count > 0 ? .loaded : .empty
                
            } catch {
                self.classError = error
                self.classLoadingState = .error
            }
        }
    }
    
    // Events
    func fetchEvents() {
        Task {
            do {
                let result = try await APIService().fetchEvents(
                    page: eventPageNumber,
                    countryCode: eventCountryCode == .worlwide ? nil : eventCountryCode.rawValue,
                    sort: eventSortOption.rawValue,
                    segmentID: selectedSegmentID,
                    genreID: nil,
                    search: nil
                )
                if let embedded = result.embedded {
                    events.append(contentsOf: embedded.events)
                }
                eventPageNumber = result.page.number
                eventMaxPages = result.page.totalPages
                eventTotalResults = result.page.totalElements
                eventLoadingState = events.count > 0 ? .loaded : .empty
                
            } catch {
                self.eventError = error
                self.eventLoadingState = .error
            }
        }
    }
    
    func getNextPage() {
        if eventPageNumber <= eventMaxPages {
            eventPageNumber += 1
            fetchEvents()
        }
    }
    
    func refreshList() {
        self.events.removeAll()
        self.eventPageNumber = 0
        fetchEvents()
    }
    
    func getSorted(option: TMEventSortingOption) {
        self.eventSortOption = option
        refreshList()
    }
    
    func changeCountryCode(code: TMCountryCode) {
        if code == eventCountryCode {
            eventIsSheetPresented = false
        } else {
            eventCountryCode = code
            eventIsSheetPresented = false
            Save().saveCountrySetting(country: code)
            refreshList()
        }
    }
}
