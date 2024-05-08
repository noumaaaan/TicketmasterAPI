//
//  VenueListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import SwiftUI

struct VenueListView: View {
    @StateObject var viewModel = VenueListViewModel()
    private let numberColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.venues, id: \.self) { venue in
                    NavigationLink {
                        VenueDetailView(venue: venue)
                    } label: {
                        VenueView(venue: venue)
                            .onAppear {
                                if venue == viewModel.venues.last {
                                    viewModel.getNextPage()
                                }
                            }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Venues")
            .toolbarTitleDisplayMode(.inlineLarge)
            .refreshable {
                viewModel.refreshList()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.isSheetPresented = true
                    } label: {
                        Text(viewModel.countryCode.flag)
                            .font(.largeTitle)
                    }
                }
            }
            .sheet(isPresented: $viewModel.isSheetPresented) {
                countryCodeSelection
                    .presentationDetents([.medium])
            }
        }
    }
}

extension VenueListView {
    var countryCodeSelection: some View {
        VStack {
            Text("Select Country")
                .font(.subheadline.bold())
                .padding(.top)
            ScrollView {
                LazyVGrid(columns: numberColumns) {
                    ForEach(TMCountryCode.allCases, id: \.self) { code in
                        
                        Button {
                            viewModel.changeCountryCode(code: code)
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
                            code == viewModel.countryCode
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
    VenueListView()
}
