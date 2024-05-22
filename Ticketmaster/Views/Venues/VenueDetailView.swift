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
            VStack(alignment: .leading, spacing: 20) {
                mapSection
                detailsSection
                boxOfficeSection
                parkingSeatingSection
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle(venue.name ?? "")
        .background(
            LinearGradient(
                gradient: Gradient(colors: GlobalConstants.Colors.venuesColor),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .toolbarBackground(
            LinearGradient(
                gradient: Gradient(colors: GlobalConstants.Colors.venuesColor),
                startPoint: .leading,
                endPoint: .trailing)
        )
    }
}

extension VenueDetailView {
    var detailsSection: some View {
        VStack(alignment: .leading) {
            Text("Details")
                .font(.title2.bold())
            Group {
                Text(venue.name ?? "")
                if let timezone = venue.timezone { Text(timezone) }
                if let line1 = venue.address?.line1 { Text(line1) }
                if let line2 = venue.address?.line2 { Text(line2) }
                if let city = venue.city?.name { Text(city) }
                if let postal = venue.postalCode { Text(postal) }
                if let country = venue.country?.name { Text(country) }
                
                urlSection
            }
        }
    }
    
    var urlSection: some View {
        Group {
            if let url = venue.url, let actual = URL(string: url) {
                Button {
                    UIApplication.shared.open(actual)
                } label: {
                    Text("\(venue.name ?? "") Ticketmaster site")
                }
            }
        }
    }
    
    var boxOfficeSection: some View {
        VStack(alignment: .leading) {
            if let boxOffice = venue.boxOfficeInfo {
                Text("Box Office")
                    .font(.title2.bold())
                Group {
                    if let phone = boxOffice.phoneNumberDetail { Text(phone) }
                    if let hours = boxOffice.openHoursDetail { Text(hours) }
                    if let payment = boxOffice.acceptedPaymentDetail { Text(payment) }
                    if let call = boxOffice.willCallDetail { Text(call) }
                }
            }
        }
    }
    
    var parkingSeatingSection: some View {
        VStack(alignment: .leading) {
            if (venue.parkingDetail ?? venue.accessibleSeatingDetail) != nil {
                Text("More information")
                    .font(.title2.bold())
                Group {
                    if let parking = venue.parkingDetail { Text(parking) }
                    if let seating = venue.accessibleSeatingDetail { Text(seating) }
                }
            }
        }
    }
    
    var mapSection: some View {
        VStack(alignment: .leading) {
            Text("Map")
                .font(.title2.bold())
            
            if let lat = Double(venue.location?.latitude ?? ""), let long = Double(venue.location?.longitude ?? "") {
                Map(bounds: .init(minimumDistance: 750, maximumDistance: 750)) {
                    Marker(venue.name ?? "", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
                }
                .frame(height: 200)
                .frame(maxWidth: .infinity, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.horizontal)
                .disabled(true)
            }
        }
    }
}

#Preview {
    VenueDetailView(venue: MockData().testVenue)
}
