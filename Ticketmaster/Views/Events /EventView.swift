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
        
        VStack {
            Text(event.name)
                .font(.subheadline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 5)
            
            if let url = event.images.first?.url {
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 300, height: 150)
                .frame(maxWidth: .infinity)
                .background(.black)
            }
            
            HStack {
                Label(event.dates.start.dateTime, systemImage: "calendar")
                    .font(.caption)
                    .foregroundStyle(.white)
                
                Label(event.dates.timezone, systemImage: "location.fill")
                    .font(.caption)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            HStack {
                Label(event.dates.start.dateTime, systemImage: "calendar")
                    .font(.caption)
                    .foregroundStyle(.white)
                
                Label(event.dates.timezone, systemImage: "location.fill")
                    .font(.caption)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        .frame(height: 250)
        .frame(maxWidth: .infinity)
        .background(Color.darkBlue)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color(.secondaryLabel), radius: 15)
        .padding()
    }
}

#Preview {
    EventView(event: MockData().testEvent)
}
