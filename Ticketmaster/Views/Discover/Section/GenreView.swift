//
//  GenreView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 21/05/2024.
//

import SwiftUI

struct GenreView: View {
    let genre: TMGenre
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(genre.name ?? "")
                    .font(.headline.bold())
                    .lineLimit(1)
                    .foregroundStyle(.white)
                
                Text(genre.ID)
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal)
        .frame(height: 37)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    GenreView(genre: MockData().testGenre)
}
