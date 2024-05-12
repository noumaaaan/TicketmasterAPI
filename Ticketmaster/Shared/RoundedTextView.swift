//
//  RoundedTextView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 12/05/2024.
//

import SwiftUI

struct RoundedTextView: View {
    var text: String
    var color: Color = .red
    
    var body: some View {
        Text(text)
            .font(.subheadline.bold())
            .padding()
            .background(color)
            .clipShape(Capsule(style: .continuous))
            .lineLimit(1)
    }
}

#Preview {
    RoundedTextView(text: "Music")
}
