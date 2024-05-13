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
                if viewModel.sections.isEmpty {
                    MessageView(message: "No discoveries.")
                } else {
                    contentView
                }
            }
            .navigationTitle("Discover")
            .toolbarTitleDisplayMode(.inlineLarge)
        }
    }
}

extension DiscoverView {
    var contentView: some View {
        List {
            ForEach(viewModel.sections, id: \.self) { section in
                NavigationLink {
                    DiscoverListView(section: section)
                } label: {
                    Text(section.segment?.name ?? "")
                }
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    DiscoverView()
}
