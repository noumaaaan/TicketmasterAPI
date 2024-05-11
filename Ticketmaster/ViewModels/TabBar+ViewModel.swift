//
//  TabBar+ViewModel.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import Foundation

final class TabBarViewModel: ObservableObject {
    
    @Published var selectedTab: TabOption = .discover
    
    func setSelected(tab: TabOption) {
        self.selectedTab = tab
    }
}
