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
        
        VStack {
            Text("Filter")
                .font(.subheadline.bold())
                .padding(.top)
            
            ScrollViewReader { proxy in
                ScrollView {
                    if let genres = section.segment?.embedded?.genres {
                        ForEach(genres, id: \.self) { genre in
                            Button {
                                action(genre)
                            } label: {
                                HStack {
                                    Text(genre.name ?? "")
                                        .foregroundStyle(genre.ID == selectedGenreID ? .blue : .white)
                                    Spacer()
                                    if genre.ID == selectedGenreID {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                            .frame(height: 10)
                            .padding()
                            .onAppear() {
                                withAnimation {
                                    proxy.scrollTo(genre.ID == selectedGenreID)
                                }
                            }
                        }
                    }
                }
            }
        }
        .background(.thinMaterial)
    }
}

#Preview {
    GenreListView(section: MockData().testSection, selectedGenreID: "KnvZfZ7vAAa") { genre in
    }
}
