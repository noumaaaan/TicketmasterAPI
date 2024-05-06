//
//  ContentView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = EventsViewModel()
        
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.events, id: \.self) { event in
                    
                    EventView(event: event)
                }
            }
        }
        .padding()
//        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
//        .preferredColorScheme(.dark)
        .task {
            await viewModel.fetchEvents()
        }
    }
}

#Preview {
    ContentView()
}
