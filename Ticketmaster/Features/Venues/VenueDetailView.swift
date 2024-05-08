//
//  VenueDetailView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import SwiftUI
import MapKit

struct VenueDetailView: View {
    let venue: TMVenue
    
    var body: some View {
        ScrollView {
            VStack {
                mapSection
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    detailsSection
                        .padding(.bottom)
                    boxOfficeSection
                        .padding(.bottom)
                    parkingSeatingSection
                        .padding(.bottom)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .navigationTitle(venue.name)
    }
}

extension VenueDetailView {
    
    var detailsSection: some View {
        VStack(alignment: .leading) {
            Text("Details")
                .font(.title3.bold())
            Group {
                Text(venue.name)
                Text(venue.timezone)
                Text(venue.address.line1)
                if let line2 = venue.address.line2 { Text(line2) }
                Text(venue.city.name)
                Text(venue.postalCode)
                Text(venue.country.name)
            }
            .font(.caption)
        }
    }
    
    var boxOfficeSection: some View {
        VStack(alignment: .leading) {
            if let boxOffice = venue.boxOfficeInfo {
                Text("Box Office")
                    .font(.title3.bold())
                Group {
                    if let phone = boxOffice.phoneNumberDetail { Text(phone) }
                    if let hours = boxOffice.openHoursDetail { Text(hours) }
                    if let payment = boxOffice.acceptedPaymentDetail { Text(payment) }
                    if let call = boxOffice.willCallDetail { Text(call) }
                }
                .font(.caption)
            }
        }
    }
    
    var parkingSeatingSection: some View {
        VStack(alignment: .leading) {
            Text("More information")
                .font(.title3.bold())
            Group {
                if let parking = venue.parkingDetail { Text(parking) }
                if let seating = venue.accessibleSeatingDetail { Text(seating) }
            }
            .font(.caption)
        }
    }
    
    var mapSection: some View {
        VStack(alignment: .leading) {
            Text("Map")
                .font(.title3.bold())
                .padding(.horizontal)
            if let lat = Double(venue.location.latitude), let long = Double(venue.location.longitude) {
                Map(bounds: .init(minimumDistance: 350, maximumDistance: 1000)) {
                    Marker(venue.name, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
                }
                .frame(height: 200)
                .frame(maxWidth: .infinity, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    VenueDetailView(venue: MockData().testVenue)
}
