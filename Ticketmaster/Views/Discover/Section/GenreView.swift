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
        VStack(alignment: .leading) {
            HStack {
                Text(genre.name ?? "")
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Divider()
                .foregroundStyle(.gray)
        }
        .padding(.horizontal)
        .frame(height: 35)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    GenreView(genre: MockData().testGenre)
}
