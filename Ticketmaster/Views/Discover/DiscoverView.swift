//
//  DiscoverView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject var viewModel = DiscoverViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                contentView
            }
            .navigationTitle("Discover")
            .toolbarTitleDisplayMode(.inlineLarge)
        }
    }
}

extension DiscoverView {
    var contentView: some View {
        Group {
            switch viewModel.loadingState {
            case .uninitialized:
                EmptyView()
            case .loaded:
                loadedView
            case .empty:
                MessageView(message: "Nothing to discover.")
            case .error:
                MessageView(message: "Error.")
            }
        }
    }
    
    var loadedView: some View {
        List {
            Section("\(viewModel.totalResults) results") {
                ForEach(viewModel.sections, id: \.self) { section in
                    NavigationLink {
                        DiscoverListView(section: section)
                    } label: {
                        Text(section.segment?.name ?? "")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    DiscoverView()
}
