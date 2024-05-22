//
//  AttractionDetailView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct AttractionDetailView: View {
    let attraction: TMAttraction
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                detailsSection
                imageSection
                aliasesSection
                socialSection
                classInformation
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle(attraction.name ?? "")
        .background(
            LinearGradient(
                gradient: Gradient(colors: GlobalConstants.Colors.purpleToBlue),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .toolbarBackground(
            LinearGradient(
                gradient: Gradient(colors: GlobalConstants.Colors.purpleToBlue),
                startPoint: .leading,
                endPoint: .trailing)
        )
    }
}

extension AttractionDetailView {
    var imageSection: some View {
        ImageView(url: attraction.images?.first?.url, width: 300, height: 200)
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    
    var detailsSection: some View {
        VStack(alignment: .leading) {
            Text(attraction.name ?? "")
                .font(.title2.bold())
            if let url = attraction.url, let actual = URL(string: url) {
                Button {
                    UIApplication.shared.open(actual)
                } label: {
                    Text("Visit website")
                }
            }
        }
    }
    
    var aliasesSection: some View {
        VStack(alignment: .leading) {
            if let aliases = attraction.aliases {
                Text("Aliases")
                    .font(.title2.bold())
                Text(aliases.joined(separator: ", "))
            }
        }
    }
    
    func individualSocialMedia(url: String, social: TMSocialMedia) -> some View {
        HStack {
            Image(social.image)
                .resizable()
                .frame(width: 20, height: 20)
            if let actual = URL(string: url) {
                Button {
                    UIApplication.shared.open(actual)
                } label: {
                    Text(social.rawValue)
                }
            }
        }
    }
    
    var socialSection: some View {
        Group {
            if let external = attraction.externalLinks {
                VStack(alignment: .leading) {
                    Text("Social")
                        .font(.title2.bold())
                    if let wiki = external.wiki?.first?.url { individualSocialMedia(url: wiki, social: .wiki) }
                    if let youtube = external.youtube?.first?.url { individualSocialMedia(url: youtube, social: .youtube) }
                    if let spotify = external.spotify?.first?.url { individualSocialMedia(url: spotify, social: .spotify) }
                    if let instagram = external.instagram?.first?.url { individualSocialMedia(url: instagram, social: .instagram) }
                    if let twitter = external.twitter?.first?.url { individualSocialMedia(url: twitter, social: .twitter) }
                    if let facebook = external.facebook?.first?.url { individualSocialMedia(url: facebook, social: .facebook) }
                }
            }
        }
    }
    
    var classInformation: some View {
        Group {
            if let classification = attraction.classifications?.first {
                VStack(alignment: .leading) {
                    Text("Classification")
                        .font(.title2.bold())
                    
                    HStack {
                        if let segment = classification.segment?.name { RoundedTextView(text: segment )}
                        if let genre = classification.genre?.name { RoundedTextView(text: genre )}
                        if let subGenre = classification.subGenre?.name { RoundedTextView(text: subGenre )}
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    AttractionDetailView(attraction: MockData().testAttraction)
}
