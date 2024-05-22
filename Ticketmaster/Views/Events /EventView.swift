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
            ImageView(url: event.images?.first?.url, width: 110, height: 75)
            
            VStack(alignment: .leading) {
                Text(event.name ?? "")
                    .foregroundStyle(.white)
                    .font(.subheadline.bold())
                    .lineLimit(2)
                
                Group {
                    if let start = event.dates?.start?.dateTime {
                        Text(formattedDate(date: start))
                            .foregroundStyle(.yellow)
                    }
                    if let venue = event.embedded?.venues?.first?.name {
                        Text(venue)
                            .foregroundStyle(.pink)
                    }
                }
                .font(.caption)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(height: 75)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    EventView(event: MockData().testEvent)
}
