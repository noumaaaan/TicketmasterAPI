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
            
        }
    }
}
            
//            List {
//                ForEach(viewModel.classifications, id: \.self) { classification in
//                    Section(classification.segment?.name ?? "") {
//                        ForEach(classification.segment?.embedded.genres ?? [], id:\.self) { genree in
//                            Text(genree.name)
//                        }
//                    }
//                }
//            }
//            ScrollView {
//                ForEach(viewModel.classifications, id: \.self) { classification in
//
//                    Section(classification.segment?.name ?? "") {
//
//                        List {
//                            
//                        }
//                    }
//
//                }
//
//            }
//        .padding()
//        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
//        .preferredColorScheme(.dark)
//        .task {
//            await viewModel.fetchClassifications()
//        }

#Preview {
    ContentView()
}
