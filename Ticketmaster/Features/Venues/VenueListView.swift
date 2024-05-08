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
        VStack {
            ForEach(viewModel.venues, id: \.self) { venue in
                Text(venue.name)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchVenues()
            }
        }
    }
}

#Preview {
    VenueListView()
}
