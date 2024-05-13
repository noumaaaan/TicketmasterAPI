//
//  AttractionListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct AttractionListView: View {
    @StateObject var viewModel = AttractionListViewModel()
    let numberColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                if viewModel.attractions.isEmpty {
                    MessageView(message: "No attractions found.")
                } else {
                    contentView
                }
            }
            .navigationTitle("Attractions")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    sortingMenu
                }
            }
        }
    }
}

extension AttractionListView {
    var sortingMenu: some View {
        AttractionSortMenu(selected: viewModel.sortOption) { sort in
            viewModel.getSorted(option: sort)
        }
    }
    
    var contentView: some View {
        ScrollView {
            LazyVGrid(columns: numberColumns) {
                ForEach(viewModel.attractions, id: \.self) { attraction in
                    NavigationLink {
                        AttractionDetailView()
                    } label: {
                        AttractionView(attraction: attraction)
                            .onAppear {
                                if attraction == viewModel.attractions.last {
                                    viewModel.getNextPage()
                                }
                            }
                    }
                }
            }
        }
    }
}


#Preview {
    AttractionListView()
}
