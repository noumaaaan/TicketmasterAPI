//
//  MessageView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 10/05/2024.
//

import SwiftUI

struct MessageView: View {
    let message: String
    
    var body: some View {
        
        VStack {
            Spacer()
            Text(message)
                .font(.subheadline.bold())
                .frame(maxWidth: .infinity)
            Spacer()
        }
    }
}

#Preview {
    MessageView(message: "No results found.")
}
