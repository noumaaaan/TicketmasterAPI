//
//  TabBarView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab: TabOption
    
    init(selectedTab: TabOption) {
        self.selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            
            VStack {
                TabView(selection: $selectedTab) {
                    
                    ForEach(TabOption.allCases, id: \.self) { tab in
                        switch tab {
                        case .discover:
                            Color.purple.ignoresSafeArea()
                        case .attractions:
                            Color.mint.ignoresSafeArea()
                        case .search:
                            Color.yellow.ignoresSafeArea()
                        case .venues:
                            Color.orange.ignoresSafeArea()
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
                        Spacer()
                        Image(systemName: selectedTab == tab ? tab.selected : tab.image)
                            .scaleEffect(selectedTab == tab ? 1.3 : 1)
                            .foregroundStyle(selectedTab == tab ? tab.color : .gray)
                            .font(.system(size: 20))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedTab = tab
                                }
                            }
                        Spacer()
                    }
                }
                .frame(height: 60)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
            }
        }
    }
}

#Preview {
    TabBarView(selectedTab: .attractions)
}
