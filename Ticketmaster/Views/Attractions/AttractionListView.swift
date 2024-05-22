//
//  AttractionListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct AttractionListView: View {
    @StateObject var viewModel = AttractionListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                contentView
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: GlobalConstants.Colors.attractionsColor),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .toolbarBackground(
                LinearGradient(
                    gradient: Gradient(colors: GlobalConstants.Colors.attractionsColor),
                    startPoint: .leading,
                    endPoint: .trailing)
            )
            .navigationTitle("Attractions")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    sortingMenu
                }
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
        }
    }
}

extension AttractionListView {
    var contentView: some View {
        Group {
            switch viewModel.loadingState {
            case .uninitialized:
                EmptyView()
            case .loaded:
                loadedView
            case .empty:
                MessageView(message: "No attractions found.")
            case .error:
                MessageView(message: "Error.")
            }
        }
    }
    
    var loadedView: some View {
        List {
            Section("\(viewModel.totalResults) results") {
                ForEach(viewModel.attractions, id: \.self) { attraction in
                    NavigationLink {
                        AttractionDetailView(attraction: attraction)
                    } label: {
                        AttractionView(attraction: attraction)
                            .onAppear {
                                if attraction == viewModel.attractions.last {
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
    
    var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: GlobalConstants.Colors.attractionsColor),
            startPoint: .leading,
            endPoint: .trailing)
    }
    
    var sortingMenu: some View {
        AttractionSortMenu(selected: viewModel.sortOption) { sort in
            viewModel.getSorted(option: sort)
        }
    }
}


#Preview {
    AttractionListView()
}
