//
//  VenueList+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import Foundation

final class VenueListViewModel: ObservableObject {
    
    @Published var venues: [TMVenue] = []
    
    func fetchVenues() async {
        Task {
            do {
                let result = try await APIService().fetchVenues()
                self.venues = result.embedded.venues
            } catch {
                print(error)
            }
        }
    }
    
}
