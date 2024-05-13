//
//  VenueSortMenu.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

import SwiftUI

struct VenueSortMenu: View {
    let selected: TMVenueSortingOption
    var action: (TMVenueSortingOption) -> Void
        
    var body: some View {
        Menu {
            ForEach(TMVenueSortingOption.allCases, id: \.self) { sort in
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
        }
    }
}

#Preview {
    VenueSortMenu(selected: .relevance) { sort in
    }
}
