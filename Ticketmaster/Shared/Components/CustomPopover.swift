//
//  CustomPopover.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 16/05/2024.
//

import SwiftUI

struct CustomPopover: View {
    let title: String
    let message: String
    let buttonTitle: String
    let primaryAction: () -> ()
    let dismissAction: () -> ()
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2.bold())
                .padding()
            
            Text(message)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Button {
                primaryAction()
            } label: {
                Text(buttonTitle)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 9))
            }
            .padding()
        }
        .overlay(alignment: .topTrailing) {
            Button {
                dismissAction()
            } label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    CustomPopover(
        title: "Test popover",
        message: "This is a test popover to see the message,This is a test popover to see the message",
        buttonTitle: "Button",
        primaryAction: {},
        dismissAction: {}
    )
}
