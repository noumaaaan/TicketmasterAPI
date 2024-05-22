//
//  EventSortMenu.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 12/05/2024.
//

import SwiftUI

struct EventSortMenu: View {
    let selected: TMEventSortingOption
    var action: (TMEventSortingOption) -> Void
        
    var body: some View {
        Menu {
            ForEach(TMEventSortingOption.allCases, id: \.self) { sort in
                Button {
                    action(sort)
                } label: {
                    HStack {
                        Text(sort.label)
                        Spacer()
                        if sort == selected {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
         } label: {
             Image("sort")
                 .resizable()
                 .frame(width: 35, height: 35)
                 .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    EventSortMenu(selected: .relevance) { sort in
    }
}
