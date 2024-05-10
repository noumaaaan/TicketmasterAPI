//
//  CountrySelectionView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 10/05/2024.
//

import SwiftUI

struct CountrySelectionView: View {
    let numberColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var selectedCountry: TMCountryCode
    let action: (TMCountryCode) -> Void
    
    var body: some View {
        VStack {
            Text("Select Country")
                .font(.subheadline.bold())
                .padding(.top)
            ScrollView {
                LazyVGrid(columns: numberColumns) {
                    ForEach(TMCountryCode.allCases, id: \.self) { code in
                        Button {
                            action(code)
                        } label: {
                            VStack {
                                Text(code.flag)
                                    .font(.title)
                                Text(code.label)
                                    .font(.caption)
                                    .foregroundStyle(.black)
                                    .lineLimit(2)
                            }
                        }
                        .frame(width: 80, height: 80)
                        .overlay(
                            code == selectedCountry
                            ? RoundedRectangle(cornerRadius: 3)
                                .stroke(.blue, lineWidth: 2)
                            : nil
                        )
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CountrySelectionView(selectedCountry: .argentina) { _ in
    }
}
