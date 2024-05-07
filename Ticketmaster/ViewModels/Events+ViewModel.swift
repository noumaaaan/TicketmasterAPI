//
//  Events+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

@MainActor
final class EventsViewModel: ObservableObject {

    @Published var events: [TMEvent] = []
    @Published var classifications: [Classification] = []
    
    func fetchEvents() async {
        Task {
            do {
                let result = try await APIService().fetchEvents()
                self.events = result.embedded.events
            } catch {
                print(error)
            }
        }
    }
    
    func fetchClassifications() async {
        Task {
            do {
                let result = try await APIService().fetchClassifications()
                self.classifications = result.embedded.classifications
                
            } catch {
                
            }
        }
    }
}
