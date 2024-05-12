//
//  VenueView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import SwiftUI

struct VenueView: View {
    let venue: TMVenue
    
    var body: some View {
        HStack {
            ImageView(url: venue.images?.first?.url, width: 130, height: 70)
            
            VStack(alignment: .leading) {
                Text(venue.name)
                    .font(.subheadline.bold())
                    .lineLimit(2)
                
                Group {
                    Text("\(venue.address?.line1 ?? "") \(venue.address?.line2 ?? "")")
                    Text("\(venue.city?.name ?? "")")
                }
                .font(.caption)
                .lineLimit(2)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(height: 70)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    VenueView(venue: MockData().testVenue)
}
