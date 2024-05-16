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
            if section.segment == nil {
                MessageView(message: "No events found.")
            } else {
                contentView
            }
        }
        .navigationTitle(section.segment?.name ?? "")
        .toolbarTitleDisplayMode(.inlineLarge)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.isSheetPresented = true
                } label: {
                    Image("filter")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundStyle((viewModel.selectedGenreID != nil) ? .red : .accent)
                }
            }
        }
        .sheet(isPresented: $viewModel.isSheetPresented) {
            GenreListView(section: section, selectedGenreID: viewModel.selectedGenreID) { genre in
                viewModel.updateGenre(genreID: genre?.ID, segmentID: section.segment?.ID)
            }
                .presentationDetents([.medium])
        }
    }
}

extension DiscoverListView {
    var contentView: some View {
        List {
            ForEach(viewModel.events, id: \.self) { event in
                NavigationLink {
                    EventDetailView(event: event)
                } label: {
                    EventView(event: event)
                }
            }
        }
        .listStyle(.grouped)
//        .task {
//            viewModel.fetchEvents(segmentID: section.segment?.ID, genreID: nil)
//        }
    }
}

#Preview {
    DiscoverListView(section: MockData().testSection)
}
