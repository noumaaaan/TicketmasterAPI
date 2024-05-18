//
//  DiscoverListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct DiscoverListView: View {
    let section: TMSection
    @StateObject var viewModel = DiscoverResultsViewModel()
    
    var body: some View {
        VStack(spacing: .zero) {
            contentView
        }
        .navigationTitle(section.segment?.name ?? "")
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
            // viewModel.setSelectedSection(section: section)
            viewModel.setSelected(section: section)
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
                MessageView(message: "No events found in \(viewModel.countryCode.label).")
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
                Section("results") {
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
        }
    }
}

#Preview {
    DiscoverListView(section: MockData().testSection)
}
