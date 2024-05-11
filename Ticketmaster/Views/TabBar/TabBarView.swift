//
//  TabBarView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel = TabBarViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $viewModel.selectedTab) {
                    ForEach(TabOption.allCases, id: \.self) { tab in
                        switch tab {
                        case .discover:
                            EventListView()
                        case .attractions:
                            Color.mint.ignoresSafeArea()
                        case .search:
                            Color.yellow.ignoresSafeArea()
                        case .venues:
                            VenueListView()
                        case .settings:
                            Color.pink.ignoresSafeArea()
                        }
                    }
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    ForEach(TabOption.allCases, id: \.self) { tab  in
                        Image(systemName: viewModel.selectedTab == tab ? tab.selected : tab.image)
                            .scaleEffect(viewModel.selectedTab == tab ? 1.5 : 1)
                            .foregroundStyle(viewModel.selectedTab == tab ? tab.color : .gray)
                            .font(.system(size: 21))
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    viewModel.setSelected(tab: tab)
                                }
                            }
                    }
                }
                .frame(height: 60)
                .background(.thinMaterial)
            }
        }
    }
}

#Preview {
    TabBarView()
}
