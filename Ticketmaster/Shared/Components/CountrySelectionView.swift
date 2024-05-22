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
    let colors: [Color]
    let action: (TMCountryCode) -> Void
    
    var body: some View {
        VStack {
            Text("Select Country")
                .font(.subheadline.bold())
                .padding()
            ScrollViewReader { proxy in
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
                                        .foregroundStyle(.white)
                                        .lineLimit(2)
                                }
                            }
                            .frame(width: 80, height: 80)
                            .overlay(
                                code == selectedCountry
                                ? RoundedRectangle(cornerRadius: 5)
                                    .stroke(.yellow, lineWidth: 2.5)
                                : nil
                            )
                            .padding(.horizontal)
                        }
                    }
                    .padding()
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(selectedCountry, anchor: .center)
                        }
                    }
                }
            }
        }
        .background(
            LinearGradient(
                colors: colors,
                startPoint: .leading,
                endPoint: .trailing
            )
            .opacity(0.19)
        )
    }
}

#Preview {
    CountrySelectionView(selectedCountry: .argentina, colors: [.blue, .red]) { _ in
    }
}
