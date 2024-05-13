//
//  DiscoverListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct DiscoverListView: View {
    @StateObject var viewModel = DiscoverListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                if viewModel.sections.isEmpty {
                    MessageView(message: "No classifications found.")
                } else {
                    contentView
                }
            }
            .navigationTitle("Discover")
            .toolbarTitleDisplayMode(.inlineLarge)
        }
    }
}

extension DiscoverListView {
    var contentView: some View {
        List {
            ForEach(viewModel.sections, id: \.self) { section in
                DisclosureGroup(section.segment?.name ?? "") {
                    ForEach(section.segment?.embedded?.genres ?? [], id: \.self) { genre in
                        NavigationLink {
                            DiscoverResultsView(genreID: genre.ID)
                        } label: {
                            Text(genre.name ?? "")
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    DiscoverListView()
}
