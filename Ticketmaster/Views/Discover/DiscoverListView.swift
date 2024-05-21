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
                Button {
                    viewModel.isSheetPresented = true
                } label: {
                    Image("filter")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
            }
        }
        .sheet(isPresented: $viewModel.isSheetPresented) {
            DiscoverFilterView(viewModel: viewModel, selectedCountry: viewModel.countryCode)
//            DiscoverFilterView(viewModel: viewModel)
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
    DiscoverListView(genre: MockData().testGenre)
}
