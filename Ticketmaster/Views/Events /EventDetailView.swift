//
//  EventDetailView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 10/05/2024.
//

import SwiftUI

struct EventDetailView: View {
    let event: TMEvent
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ImageView(url: event.images?.first?.url, width: 300, height: 200)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                detailsSection
                datesInformation
                priceInformation
                salesInformation
                venueInformation
                promoterInformation
                productsInformation
                seatInformation
                limitInformation
                classInformation
                
                
            }
            .padding()
        }
        .navigationTitle(event.name)
    }
}

extension EventDetailView {
    var detailsSection: some View {
        VStack(alignment: .leading) {
            Text(event.type.capitalized)
                .font(.title2.bold())
            Text(event.name)
            if let url = event.url, let actual = URL(string: url) {
                Button {
                    UIApplication.shared.open(actual)
                } label: {
                    Text("Find tickets")
                }
            }
        }
        
    }
    
    var salesInformation: some View {
        VStack(alignment: .leading) {
            if let publicSales = event.sales?.publicSales {
                Text("Sales")
                    .font(.title2.bold())
                if let start = publicSales.startDateTime { Text("Start: \(formattedDate(date: start))") }
                if let end = publicSales.endDateTime { Text("End: \(formattedDate(date: end))") }
            }
        }
    }
    
    var datesInformation: some View {
        VStack(alignment: .leading) {
            if let dates = event.dates {
                Text("Dates")
                    .font(.title2.bold())
                if let start = dates.start?.dateTime { Text(formattedDate(date: start)) }
                if let timezone = dates.timezone { Text(timezone) }
                if let code = dates.status?.code { Text(code) }
            }
        }
    }
    
    var classInformation: some View {
        VStack(alignment: .leading) {
            if let classification = event.classifications?.first {
                Text("Classification")
                    .font(.title2.bold())
                
                HStack {
                    if let segment = classification.segment { RoundedTextView(text: segment.name )}
                    if let genre = classification.genre { RoundedTextView(text: genre.name )}
                    if let subGenre = classification.subGenre { RoundedTextView(text: subGenre.name )}
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    var promoterInformation: some View {
        VStack(alignment: .leading) {
            if let prom = event.promoter {
                Text("Promoter")
                    .font(.title2.bold())
                if let promoter = prom.name { Text(promoter) }
                if let description = prom.description { Text(description) }
            }
        }
    }
    
    var priceInformation: some View {
        VStack(alignment: .leading) {
            if let price = event.priceRanges?.first {
                Text("Prices from")
                    .font(.title2.bold())
                if let min = price.min { Text( "\(String(min)) \(price.currency ?? "")") }
                if let max = price.max { Text( "\(String(max)) \(price.currency ?? "")") }
            }
        }
    }
    
    var productsInformation: some View {
        VStack(alignment: .leading) {
            if let products = event.products {
                Text("Products")
                    .font(.title2.bold())

                ForEach(products, id: \.self) { product in
                    VStack(alignment: .leading) {
                        if let name = product.name { Text(name) }
                        if let url = product.url, let actual = URL(string: url) {
                            Button {
                                UIApplication.shared.open(actual)
                            } label: {
                                Text(url)
                                    .truncationMode(.tail)
                                    .lineLimit(1)
                            }
                        }
                    }
                }
            }
        }
    }
    
    var seatInformation: some View {
        VStack(alignment: .leading) {
            if let url = event.seatmap?.staticUrl, let actual = URL(string: url) {
                VStack(alignment: .leading) {
                    Text("Seatmap")
                        .font(.title2.bold())
                    Button {
                        UIApplication.shared.open(actual)
                    } label: {
                        Text(url)
                            .truncationMode(.tail)
                            .lineLimit(1)
                    }
                }
            }
        }
    }
    
    var limitInformation: some View {
        VStack(alignment: .leading) {
            if let limit = event.ticketLimit?.info {
                Text("Limit")
                    .font(.title2.bold())
                Text(limit)
            }
        }
    }
    
    var venueInformation: some View {
        VStack(alignment: .leading) {
            if let venue = event.embedded?.venues?.first {
                Text("Venue")
                    .font(.title2.bold())
                
                NavigationLink {
                    VenueDetailView(venue: venue)
                } label: {
                    VenueView(venue: venue)
                }
            }
        }
    }
    
    /// TODO: Embedded attracion.
}

#Preview {
    EventDetailView(event: MockData().testEvent)
}
