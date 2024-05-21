//
//  GenreDropdownView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 18/05/2024.
//

import SwiftUI

struct GenreDropdownView: View {
    let sectionTitle: String
    let placeholder: String
    var canDeselect: Bool
    var section: TMSection?
    
    @State var isExpanded: Bool = false
    @Binding var selectedGenre: TMGenre?
    
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
                        Text(selectedGenre?.name ?? placeholder)
                            .font(.subheadline)
                            .italic(selectedGenre == nil)
                        
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.subheadline.bold())
                            .rotationEffect(isExpanded ? .degrees(180) : .zero)
                    }
                    .foregroundStyle(.white)
                    .padding()
                }
                
//                if isExpanded {
//                    VStack {
//                        ScrollViewReader { proxy in
//                            ScrollView {
//                                ForEach(section.segment?.embedded?.genres, id: \.self) { genre in
//                                    Group {
//                                        Button {
//                                            withAnimation(.snappy) {
//                                                if canDeselect {
//                                                    selectedGenre = selectedGenre == genre ? nil : genre
//                                                } else {
//                                                    selectedGenre = genre
//                                                }
//                                                isExpanded.toggle()
//                                            }
//                                        } label: {
//                                            HStack {
//                                                Text(genre.name)
//                                                    .foregroundStyle(selectedGenre == genre ? .blue : .white)
//                                                    .opacity(selectedGenre == genre ? 1 : 0.7)
//                                                Spacer()
//                                                if selectedGenre == genre {
//                                                    Image(systemName: "checkmark")
//                                                        .font(.subheadline.bold())
//                                                }
//                                            }
//                                            .padding(.horizontal)
//                                            .padding(.vertical, 5)
//                                        }
//                                    }
//                                    .onAppear {
//                                        withAnimation {
//                                            proxy.scrollTo(selectedGenre, anchor: .center)
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                    .padding(.bottom, 5)
//                    .transition(.move(edge: .bottom))
//                }
            }
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 15)
        }
        .frame(width: 300)
    }
}


#Preview {
    GenreDropdownView(
        sectionTitle: "",
        placeholder: "",
        canDeselect: true,
        section: MockData().testSection,
        selectedGenre: .constant(nil)
    )
}
