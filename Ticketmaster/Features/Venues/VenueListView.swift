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
            List {
                ForEach(viewModel.venues, id: \.self) { venue in
                    NavigationLink {
                        VenueDetailView(venue: venue)
                    } label: {
                        VenueView(venue: venue)
                            .onAppear {
                                if venue == viewModel.venues.last {
                                    viewModel.getNextPage()
                                }
                            }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Venues")
            .toolbarTitleDisplayMode(.inlineLarge)
            .refreshable {
                viewModel.refreshList()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Pressed")
                    } label: {
                        Text(viewModel.countryCode.flag)
                            .font(.largeTitle)
                    }
                }
            }
        }
    }
}

#Preview {
    VenueListView()
}
