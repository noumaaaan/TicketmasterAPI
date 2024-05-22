//
//  AttractionView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct AttractionView: View {
    let attraction: TMAttraction
    var body: some View {
        
        HStack {
            ImageView(url: attraction.images?.first?.url, width: 130, height: 70)
            
            VStack(alignment: .leading) {
                Text(attraction.name ?? "")
                    .foregroundStyle(.white)
                    .font(.headline.bold())
                    .lineLimit(2)
                
                if let aliases = attraction.aliases {
                    Text(aliases.joined(separator: ", "))
                        .font(.caption)
                        .lineLimit(2)
                        .foregroundStyle(.yellow)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .frame(height: 70)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    AttractionView(attraction: MockData().testAttraction)
}
