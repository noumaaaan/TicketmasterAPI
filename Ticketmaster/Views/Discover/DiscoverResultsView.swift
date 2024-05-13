//
//  DiscoverResultsView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct DiscoverResultsView: View {
    
    @StateObject var viewModel = DiscoverResultsViewModel()
    let genreID: String
    
    var body: some View {
        VStack(spacing: .zero) {
            eventsView
        }
        .navigationTitle("Discover")
        .toolbarTitleDisplayMode(.inlineLarge)
    }
}

extension DiscoverResultsView {
    var eventsView: some View {
        List {
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
        .listStyle(.grouped)
        .task {
            viewModel.fetchGenreEvents(genreID: genreID)
        }
    }
}

#Preview {
    DiscoverResultsView(genreID: "")
}
