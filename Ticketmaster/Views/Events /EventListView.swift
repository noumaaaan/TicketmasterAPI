//
//  EventListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import SwiftUI

struct EventListView: View {
    @StateObject var viewModel = EventListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                contentView
            }
            .navigationTitle("Events")
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
            .searchable(text: $viewModel.searchTerm, placement: .navigationBarDrawer(displayMode: .always))
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
        }
    }
}

extension EventListView {
    var sortingMenu: some View {
        EventSortMenu(selected: viewModel.sortOption) { sort in
            viewModel.getSorted(option: sort)
        }
    }
    
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
    EventListView()
}
