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
            ZStack {
                VStack(spacing: .zero) {
                    contentView
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: GlobalConstants.Colors.purpleToBlue),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .toolbarBackground(
                    LinearGradient(
                        gradient: Gradient(colors: GlobalConstants.Colors.purpleToBlue),
                        startPoint: .leading,
                        endPoint: .trailing)
                )
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

extension EventListView {
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
    
    var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: GlobalConstants.Colors.purpleToBlue),
            startPoint: .leading,
            endPoint: .trailing)
    }
    
    var sortingMenu: some View {
        EventSortMenu(selected: viewModel.sortOption) { sort in
            viewModel.getSorted(option: sort)
        }
    }
    
    var loadedView: some View {
        VStack(spacing: .zero) {
            List {
                Section("\(viewModel.totalResults) results - \(viewModel.countryCode.label)") {
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
                        .listRowBackground(backgroundGradient)
                    }
                }
                .foregroundStyle(.yellow)
            }
            .scrollContentBackground(.hidden)
            .listStyle(.grouped)
        }
    }
    
    var popoverView: some View {
        CustomPopover(
            title: "No events found",
            message: "No events found matching \"\(viewModel.searchTerm)\" in \(viewModel.countryCode.label). Would you like to search worlwide?",
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
    EventListView()
}
