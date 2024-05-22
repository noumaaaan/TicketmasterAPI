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
            .background(
                LinearGradient(
                    gradient: Gradient(colors: GlobalConstants.Colors.discoverColor),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .toolbarBackground(
                LinearGradient(
                    gradient: Gradient(colors: GlobalConstants.Colors.discoverColor),
                    startPoint: .leading,
                    endPoint: .trailing)
            )
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
                alternate
            case .empty:
                MessageView(message: "Nothing to discover.")
            case .error:
                MessageView(message: "Error.")
            }
        }
    }
    
    var loadedView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                ForEach(viewModel.sections, id: \.self) { section in
                    Section {
                        ForEach(section.segment?.embedded?.genres ?? [], id: \.self) { genre in
                            NavigationLink {
                                DiscoverListView(genre: genre)
                            } label: {
                                GenreView(genre: genre)
                            }
                        }
                    } header: {
                        SectionHeaderView(section: section)
                    }
                }
            }
            .padding(.vertical)
        }
    }
    
    var alternate: some View {
        ScrollView {
                ForEach(viewModel.sections, id:\.self) { section in
                    DisclosureGroup(
                        content: {
                            
                            VStack(spacing: .zero) {
                                ForEach(section.segment?.embedded?.genres ?? [], id: \.self) { genre in
                                        NavigationLink {
                                            DiscoverListView(genre: genre)
                                        } label: {
                                            GenreView(genre: genre)
                                        }
                                }
                            }
                            .padding(.vertical)
                        },
                        label: {
                            SectionHeaderView(section: section)
                        }
                    )
                    .padding(.vertical, 2)
                    .disclosureGroupStyle(PaddedDisclosureGroup())
                }
            }
            .padding(.vertical)
    }
}

struct PaddedDisclosureGroup: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Button {
                withAnimation {
                    configuration.isExpanded.toggle()
                }
            } label: {
                HStack {
                    configuration.label
                    Spacer()
                    Image(systemName: configuration.isExpanded ? "chevron.down" : "chevron.forward")
                        .contentTransition(.symbolEffect)
                        .padding(.trailing)
                }
            }
            .background(Color.init(hex: "00224D"))
            
            if configuration.isExpanded {
                configuration.content
                    .transition(.asymmetric(insertion: .push(from: .bottom), removal: .identity))
            }
        }
    }
}

#Preview {
    DiscoverView()
}
