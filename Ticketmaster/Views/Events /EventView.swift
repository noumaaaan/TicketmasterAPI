//
//  EventView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import SwiftUI

struct EventView: View {
    let event: TMEvent
    
    var body: some View {
        HStack {
            ImageView(
                url: event.images?.first?.url,
                width: 130, height: 100,
                backgroundColor: .black,
                cornerRadius: .zero,
                aspectRatio: .fill
            )
            
            VStack(alignment: .leading) {
                Text(event.name)
                    .font(.subheadline.bold())
                    .foregroundStyle(.black)
                    .lineLimit(2)
                
                Group {
                    if let start = event.dates?.start?.dateTime { Text(formattedDate(date: start)) }
                    if let venue = event.embedded?.venues?.first?.name { Text(venue) }
                }
                .font(.caption)
                .lineLimit(2)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    EventView(event: MockData().testEvent)
}
