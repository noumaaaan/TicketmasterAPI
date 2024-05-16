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
            ZStack {
                VStack(spacing: .zero) {
                    contentView
                }
                .navigationTitle("Venues")
                .toolbarTitleDisplayMode(.inlineLarge)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        sortingMenu
                    }
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
                .searchable(text: $viewModel.searchTerm)
                .onSubmit(of: .search) {
                    withAnimation(.easeInOut) {
                        viewModel.refreshList()
                    }
                }
                .onChange(of: viewModel.searchTerm) {
                    if viewModel.searchTerm.isEmpty {
                        withAnimation(.easeInOut) {
                            viewModel.refreshList()
                        }
                    }
                }
                
                if viewModel.isAlertPresented {
                    popoverView
                }
            }
        }
    }
}

extension VenueListView {
    var contentView: some View {
        Group {
            switch viewModel.loadingState {
            case .uninitialized:
                EmptyView()
            case .loaded:
                loadedView
            case .empty:
                MessageView(message: "No venues found in \(viewModel.countryCode.label).")
            case .error:
                MessageView(message: "Error.")
            }
        }
    }
    
    var sortingMenu: some View {
        VenueSortMenu(selected: viewModel.sortOption) { sort in
            viewModel.getSorted(option: sort)
        }
    }
    
    var loadedView: some View {
        List {
            Section("\(viewModel.totalResults) results - \(viewModel.countryCode.label)") {
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
        }
        .listStyle(.grouped)
    }
    
    var popoverView: some View {
        CustomPopover(
            title: "No venues found",
            message: "No venues found matching \"\(viewModel.searchTerm)\" in \(viewModel.countryCode.label). Would you like to search worlwide?",
            buttonTitle: "Search worldwide"
        ) {
            viewModel.searchWorldwide()
        } dismissAction: {
            viewModel.isAlertPresented.toggle()
        }
        .transition(
            .opacity.combined(with: .scale)
            .animation(.bouncy(duration: 0.2, extraBounce: 0.3))
        )
    }
}

#Preview {
    VenueListView()
}
