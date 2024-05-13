//
//  DiscoverResultsView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct DiscoverResultsView: View {
    let genreID: String
    @StateObject var viewModel = DiscoverResultsViewModel()
    
    var body: some View {
        VStack(spacing: .zero) {
            eventsView
            attractionsView
            venueView
        }
        .navigationTitle("Discover")
        .toolbarTitleDisplayMode(.inlineLarge)
    }
}

extension DiscoverResultsView {
    var eventsView: some View {
        List {
            if !viewModel.events.isEmpty {
                Section("Events") {
                    ForEach(viewModel.events, id: \.self) { event in
                        NavigationLink {
                            EventDetailView(event: event)
                        } label: {
                            EventView(event: event)
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
    
    var attractionsView: some View {
        List {
            if !viewModel.attractions.isEmpty {
                Section("Attractions") {
                    ForEach(viewModel.attractions, id: \.self) { attraction in
                        NavigationLink {
                            AttractionDetailView(attraction: attraction)
                        } label: {
                            AttractionView(attraction: attraction)
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
    
    var venueView: some View {
        List {
            if !viewModel.venues.isEmpty {
                Section("Venues") {
                    ForEach(viewModel.venues, id: \.self) { venue in
                        NavigationLink {
                            VenueDetailView(venue: venue)
                        } label: {
                            VenueView(venue: venue)
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    DiscoverResultsView(genreID: "KnvZfZ7vAAa")
}
