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
        
        VStack {
            ImageView(
                url: attraction.images?.first?.url,
                width: 190,
                height: 150,
                cornerRadius: .zero,
                aspectRatio: .fill
            )
            
            Text(attraction.name ?? "")
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .font(.subheadline.bold())
                .foregroundStyle(.white)
            
            Spacer()
        }
        .padding()
        .frame(width: 200, height: 230)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    AttractionView(attraction: MockData().testAttraction)
}
