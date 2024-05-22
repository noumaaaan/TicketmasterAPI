//
//  AttractionSortMenu.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 13/05/2024.
//

import SwiftUI

struct AttractionSortMenu: View {
    let selected: TMAttractionSortingOption
    var action: (TMAttractionSortingOption) -> Void
        
    var body: some View {
        Menu {
            ForEach(TMAttractionSortingOption.allCases, id: \.self) { sort in
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
    AttractionSortMenu(selected: .relevance) { sort in
    }
}
