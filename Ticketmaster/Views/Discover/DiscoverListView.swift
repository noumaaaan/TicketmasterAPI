//
//  DiscoverListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct DiscoverListView: View {
    let genre: TMGenre
    @StateObject var viewModel = DiscoverResultsViewModel()
    
    var body: some View {
        VStack(spacing: .zero) {
            contentView
        }
        .navigationTitle(genre.name ?? "")
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
        .task {
            viewModel.setSelected(genre: genre)
        }
    }
}

extension DiscoverListView {
    var contentView: some View {
        Group {
            switch viewModel.loadingState {
            case .uninitialized:
                EmptyView()
            case .loaded:
                loadedView
            case .empty:
                MessageView(message: viewModel.errorDescription)
            case .error:
                MessageView(message: "Error.")
            }
        }
    }
    
    var sortingMenu: some View {
        EventSortMenu(selected: viewModel.sortOption) { sort in
            viewModel.getSorted(option: sort)
        }
    }
    
    var loadedView: some View {
        VStack(spacing: .zero) {
            List {
                Section("\(viewModel.totalResults) results") {
                    ForEach(viewModel.events, id: \.self) { event in
                        NavigationLink {
                            EventDetailView(event: event)
                        } label: {
                            EventView(event: event)
                                .onAppear {
                                    if event == viewModel.events.last {
                                        viewModel.getNextPage()
                                    }
                                }
                        }
                    }
                }
            }
            .listStyle(.grouped)
        }
    }    
}

#Preview {
    DiscoverListView(genre: MockData().testGenre)
}
