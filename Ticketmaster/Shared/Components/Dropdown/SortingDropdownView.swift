//
//  SortingDropdownView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 18/05/2024.
//

import SwiftUI

struct SortingDropdownView: View {
    let sectionTitle: String
    let placeholder: String
    var canDeselect: Bool
    
    @State var isExpanded: Bool = false
    @Binding var selectedSortingOption: TMEventSortingOption?
    
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
                        Text(selectedSortingOption?.label ?? placeholder)
                            .font(.subheadline)
                            .italic(selectedSortingOption == nil)
                        
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
                                ForEach(TMEventSortingOption.allCases, id: \.self) { option in
                                    Group {
                                        Button {
                                            withAnimation(.snappy) {
                                                if canDeselect {
                                                    selectedSortingOption = selectedSortingOption == option ? nil : option
                                                } else {
                                                    selectedSortingOption = option
                                                }
                                                isExpanded.toggle()
                                            }
                                        } label: {
                                            HStack {
                                                Text(option.label)
                                                    .foregroundStyle(selectedSortingOption == option ? .blue : .white)
                                                    .opacity(selectedSortingOption == option ? 1 : 0.7)
                                                Spacer()
                                                if selectedSortingOption == option {
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
                                            proxy.scrollTo(selectedSortingOption, anchor: .center)
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
    SortingDropdownView(
        sectionTitle: "Sorting",
        placeholder: "Select sorting option",
        canDeselect: false,
        selectedSortingOption: .constant(.relevance)
    )
}
