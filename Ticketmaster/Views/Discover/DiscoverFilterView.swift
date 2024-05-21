//
//  DiscoverFilterView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 18/05/2024.
//

import SwiftUI

struct DiscoverFilterView: View {
    let viewModel: DiscoverResultsViewModel
    
    @State var selectedCountry: TMCountryCode?
    @State var selectedSortingOption: TMEventSortingOption?
    @State var selectedGenre: TMGenre?
        
    var body: some View {
        VStack {

            CountryDropdownView(
                sectionTitle: "Country",
                placeholder: "Select country",
                canDeselect: false,
                selectedCountry: $selectedCountry
            )
            .padding(.bottom)
            
            SortingDropdownView(
                sectionTitle: "Order",
                placeholder: "Select sort order",
                canDeselect: false,
                selectedSortingOption: $selectedSortingOption
            )
            .padding(.bottom)
            
            GenreDropdownView(
                sectionTitle: "Genre",
                placeholder: "Select genre",
                canDeselect: true,
                section: viewModel.selectedSection,
                selectedGenre: $selectedGenre
            )
            .padding(.bottom)
            
//            DropdownView(
//                sectionTitle: "Sort",
//                placeholder: "Select sort order",
//                options: TMEventSortingOption.allCases.map { $0.label },
//                canDeselect: false,
//                selectedOption: viewModel.sortOption.label
//            )
//            .padding(.bottom)
//            
//            if let genres = viewModel.selectedSection?.segment?.embedded?.genres {
//                DropdownView(
//                    sectionTitle: "Genre",
//                    placeholder: "Filter genre",
//                    options: genres.map { $0.name ?? "" },
//                    canDeselect: true,
//                    selectedOption: viewModel.selectedGenre?.name
//                )
//                .padding(.bottom)
//            }
            
            HStack(spacing: 20) {
                Button {
                    print(selectedCountry)
                    print(selectedSortingOption)
                    print(selectedGenre)
                } label: {
                    Text("Filter")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundStyle(.white)
                        .frame(width: 100)
                        .background(.blue3)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                }
                
                Button {
                } label: {
                    Text("Cancel")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundStyle(.white)
                        .frame(width: 100)
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                }
            }
        }
        .interactiveDismissDisabled()
        .padding(.vertical)
    }
}

#Preview {
    DiscoverFilterView(viewModel: DiscoverResultsViewModel())
}
