//
//  PreferencesListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 16/05/2024.
//

import SwiftUI

struct PreferencesListView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: .zero) {
                    contentView
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: GlobalConstants.Colors.eventsColor),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .toolbarBackground(
                    LinearGradient(
                        gradient: Gradient(colors: GlobalConstants.Colors.eventsColor),
                        startPoint: .leading,
                        endPoint: .trailing)
                )
                .navigationTitle("About")
                .toolbarTitleDisplayMode(.inlineLarge)
            }
        }
    }
}

extension PreferencesListView {
    var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: GlobalConstants.Colors.eventsColor),
            startPoint: .leading,
            endPoint: .trailing)
    }
    
    var contentView: some View {
        VStack {

            Image("ticketmasterLogo")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("This application utilises the Ticketmaster API working against many platforms including Ticketmaster, TicketWeb, Universe, FrontGate, Ticketmaster Resale (TMR) and more.")
                
                if let url = URL(string: "https://developer.ticketmaster.com/products-and-docs/apis/getting-started/") {
                    Button {
                        UIApplication.shared.open(url)
                    } label: {
                        Text("API Documentation")
                            .foregroundStyle(.yellow)
                    }
                }
                
                if let url = URL(string: "https://developer.ticketmaster.com/support/terms-of-use/") {
                    Button {
                        UIApplication.shared.open(url)
                    } label: {
                        Text("General terms of use")
                            .foregroundStyle(.yellow)
                    }
                }
                
                Text("Copyright © Nouman Mehmood")
                if let url = URL(string: "https://github.com/noumaaaan/TicketmasterAPI") {
                    Button {
                        UIApplication.shared.open(url)
                    } label: {
                        Text("GitHub Repository")
                            .foregroundStyle(.yellow)
                    }
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.caption)
            .padding()
            
//            NavigationLink {
//                APODView()
//            } label: {
//                Text("APOD")
//                    .foregroundStyle(.yellow)
//                    .font(.subheadline.bold())
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal)
//            }
//            .padding(.top, 30)
            
            Spacer()
        }
    }
}

#Preview {
    PreferencesListView()
}
