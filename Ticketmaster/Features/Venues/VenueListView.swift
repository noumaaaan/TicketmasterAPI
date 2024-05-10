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
            VStack(spacing: .zero) {
                if viewModel.venues.isEmpty {
                    MessageView(message: "No venues found.")
                } else {
                    contentView
                }
            }
            .navigationTitle("Venues")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.isSheetPresented = true
                    } label: {
                        Text(viewModel.countryCode.flag)
                            .font(.largeTitle)
                    }
                }
            }
            .sheet(isPresented: $viewModel.isSheetPresented) {
                CountrySelectionView(selectedCountry: viewModel.countryCode) { code in
                    viewModel.changeCountryCode(code: code)
                }
                .presentationDetents([.medium])
            }
        }
    }
}

extension VenueListView {
    var contentView: some View {
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
    }
}


#Preview {
    VenueListView()
}
