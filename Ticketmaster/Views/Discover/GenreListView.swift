//
//  GenreListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct GenreListView: View {
    let section: TMSection
    let selectedGenreID: String?
    let action: (TMGenre?) -> Void
    
    var body: some View {
        VStack(spacing: .zero) {
            if section.segment == nil {
                MessageView(message: "No genres found.")
            } else {
                contentView
            }
        }
        .navigationTitle(section.segment?.name ?? "")
        .toolbarTitleDisplayMode(.inlineLarge)
    }
}

extension GenreListView {
    var contentView: some View {
        List {
            if let genres = section.segment?.embedded?.genres {
                ForEach(genres, id: \.self) { genre in
                    Button {
                        action(genre)
                    } label: {
                        HStack {
                            Text(genre.name ?? "")
                                .foregroundStyle(.white)
                            Spacer()
                            if genre.ID == selectedGenreID {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    GenreListView(section: MockData().testSection, selectedGenreID: "KnvZfZ7vAAa") { genre in
    }
}
