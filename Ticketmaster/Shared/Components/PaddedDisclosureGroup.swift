//
//  PaddedDisclosureGroup.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 22/05/2024.
//

import Foundation
import SwiftUI

struct PaddedDisclosureGroup: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Button {
                withAnimation {
                    configuration.isExpanded.toggle()
                }
            } label: {
                HStack {
                    configuration.label
                    Spacer()
                    Image(systemName: configuration.isExpanded ? "chevron.down" : "chevron.forward")
                        .contentTransition(.symbolEffect)
                        .padding(.trailing)
                }
            }
            .background(Color.init(hex: "00224D"))
            
            if configuration.isExpanded {
                configuration.content
                    .transition(.asymmetric(insertion: .push(from: .bottom), removal: .identity))
            }
        }
    }
}
