//
//  DiscoverListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct DiscoverListView: View {
    @StateObject var viewModel: DiscoverViewModel
    let section: TMSection
    
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
                    viewModel.eventIsSheetPresented = true
                } label: {
                    Text(viewModel.eventCountryCode.flag)
                        .font(.largeTitle)
                }
            }
        }
        .sheet(isPresented: $viewModel.eventIsSheetPresented) {
            CountrySelectionView(selectedCountry: viewModel.eventCountryCode) { code in
                viewModel.changeCountryCode(code: code)
            }
            .presentationDetents([.medium])
        }
    }
}

extension DiscoverListView {
    var contentView: some View {
        Group {
            switch viewModel.eventLoadingState {
            case .uninitialized:
                EmptyView()
            case .loaded:
                loadedView
            case .empty:
                MessageView(message: "No events found in \(viewModel.eventCountryCode.label).")
            case .error:
                MessageView(message: "Error.")
            }
        }
    }
    
    var sortingMenu: some View {
        EventSortMenu(selected: viewModel.eventSortOption) { sort in
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
    DiscoverListView(viewModel: DiscoverViewModel(), section: MockData().testSection)
}
