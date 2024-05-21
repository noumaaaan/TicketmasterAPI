//
//  CountryDropdownView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 18/05/2024.
//

import SwiftUI

struct CountryDropdownView: View {
    let sectionTitle: String
    let placeholder: String
    var canDeselect: Bool
    
    @State var isExpanded: Bool = false
    @Binding var selectedCountry: TMCountryCode?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sectionTitle)
                .font(.caption)
                .foregroundStyle(.gray)
            
            VStack {
                Button {
                    withAnimation(.snappy) {
                        isExpanded.toggle()
                    }
                } label: {
                    HStack {
                        Group {
                            if let selectedCountry = selectedCountry {
                                Text("\(selectedCountry.flag) \(selectedCountry.label)")
                            } else {
                                Text(placeholder)
                            }
                        }
                        .font(.subheadline)
                        .italic(selectedCountry == nil)
                        
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.subheadline.bold())
                            .rotationEffect(isExpanded ? .degrees(180) : .zero)
                    }
                    .foregroundStyle(.white)
                    .padding()
                }
                
                if isExpanded {
                    VStack {
                        ScrollViewReader { proxy in
                            ScrollView {
                                ForEach(TMCountryCode.allCases, id: \.self) { country in
                                    Group {
                                        Button {
                                            withAnimation(.snappy) {
                                                if canDeselect {
                                                    selectedCountry = selectedCountry == country ? nil : country
                                                } else {
                                                    selectedCountry = country
                                                }
                                                isExpanded.toggle()
                                            }
                                        } label: {
                                            HStack {
                                                Text("\(country.flag) \(country.label)")
                                                    .foregroundStyle(selectedCountry == country ? .blue : .white)
                                                    .opacity(selectedCountry == country ? 1 : 0.7)
                                                Spacer()
                                                if selectedCountry == country {
                                                    Image(systemName: "checkmark")
                                                        .font(.subheadline.bold())
                                                }
                                            }
                                            .padding(.horizontal)
                                            .padding(.vertical, 5)
                                        }
                                    }
                                    .onAppear {
                                        withAnimation {
                                            proxy.scrollTo(selectedCountry, anchor: .center)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 5)
                    .transition(.move(edge: .bottom))
                }
            }
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 15)
        }
        .frame(width: 300)
    }
}

#Preview {
    CountryDropdownView(
        sectionTitle: "Brand",
        placeholder: "Select",
        canDeselect: false, 
        selectedCountry: .constant(.argentina)
    )
}
