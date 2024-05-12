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
        Group {
            if let publicSales = event.sales?.publicSales {
                VStack(alignment: .leading) {
                    Text("Sales")
                        .font(.title2.bold())
                    if let start = publicSales.startDateTime { Text("Start: \(formattedDate(date: start))") }
                    if let end = publicSales.endDateTime { Text("End: \(formattedDate(date: end))") }
                }
            }
        }
    }
    
    var datesInformation: some View {
        Group {
            if let dates = event.dates {
                VStack(alignment: .leading) {
                    Text("Dates")
                        .font(.title2.bold())
                    if let start = dates.start?.dateTime { Text(formattedDate(date: start)) }
                    if let timezone = dates.timezone { Text(timezone) }
                    if let code = dates.status?.code { Text(code) }
                }
            }
        }
    }
    
    var classInformation: some View {
        Group {
            if let classification = event.classifications?.first {
                VStack(alignment: .leading) {
                    Text("Classification")
                        .font(.title2.bold())
                    
                    HStack {
                        if let segment = classification.segment { RoundedTextView(text: segment.name )}
                        if let genre = classification.genre { RoundedTextView(text: genre.name )}
                        if let subGenre = classification.subGenre { RoundedTextView(text: subGenre.name )}
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.bottom)
            }
        }
    }
    
    var promoterInformation: some View {
        Group {
            if let prom = event.promoter {
                VStack(alignment: .leading) {
                    Text("Promoter")
                        .font(.title2.bold())
                    if let promoter = prom.name { Text(promoter) }
                    if let description = prom.description { Text(description) }
                }
            }
        }
    }
    
    var priceInformation: some View {
        Group {
            if let price = event.priceRanges?.first {
                VStack(alignment: .leading) {
                    Text("Prices from")
                        .font(.title2.bold())
                    if let min = price.min { Text( "\(String(min)) \(price.currency ?? "")") }
                    if let max = price.max { Text( "\(String(max)) \(price.currency ?? "")") }
                }
            }
        }
    }
    
    var productsInformation: some View {
        Group {
            if let products = event.products {
                VStack(alignment: .leading) {
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
    }
    
    var seatInformation: some View {
        Group {
            if let url = event.seatmap?.staticUrl, let actual = URL(string: url) {
                VStack(alignment: .leading) {
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
    }
    
    var limitInformation: some View {
        Group {
            if let limit = event.ticketLimit?.info {
                VStack(alignment: .leading) {
                    Text("Limit")
                        .font(.title2.bold())
                    Text(limit)
                }
            }
        }
    }
    
    var venueInformation: some View {
        Group {
            if let venue = event.embedded?.venues?.first {
                VStack(alignment: .leading) {
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
    }
    
    /// TODO: Embedded attracion.
}

#Preview {
    EventDetailView(event: MockData().testEvent)
}
