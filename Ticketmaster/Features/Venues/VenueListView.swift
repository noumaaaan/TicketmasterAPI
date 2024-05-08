//
//  VenueListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import SwiftUI

struct VenueListView: View {
    @StateObject var viewModel = VenueListViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.venues, id: \.self) { venue in
                        NavigationLink {
                            VenueDetailView(venue: venue)
                        } label: {
                            VenueView(venue: venue)
                        }
                    }
                }
                .navigationTitle("Venues")
                .toolbarTitleDisplayMode(.inlineLarge)
            }
            .onAppear {
                Task {
                    await viewModel.fetchVenues()
                }
            }
            
        }
    }
}

#Preview {
    VenueListView()
}
