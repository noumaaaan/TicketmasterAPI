//
//  EventListView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import SwiftUI

struct EventListView: View {
    @StateObject var viewModel = EventListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                if viewModel.events.isEmpty {
                    MessageView(message: "No events found.")
                } else {
                    contentView
                }
            }
            .navigationTitle("Events")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
//                    Button {
//                        viewModel.isSheetPresented = true
//                    } label: {
//                        Image("sort")
//                            .resizable()
//                            .frame(width: 35, height: 35)
//                    }
                    menuItem
                }
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
                CountrySelectionView(selectedCountry: viewModel.countryCode) { code in
                    viewModel.changeCountryCode(code: code)
                }
                .presentationDetents([.medium])
            }
        }
    }
}

extension EventListView {
    
    var menuItem: some View {
        Menu {
            ForEach(SortingOption.allCases, id: \.self) { sort in
                Button {
                    viewModel.getSorted(option: sort)
                } label: {
                    HStack {
                        Text(sort.label)
                        Spacer()
                        if sort == viewModel.sortOption {
                            Image(systemName: "checkmark.rectangle")
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
    
    var contentView: some View {
        List {
            ForEach(viewModel.events, id: \.self) { event in
                NavigationLink {
                    EventDetailView()
                } label: {
                    EventView(event: event)
                        .onAppear {
                            if event == viewModel.events.last {
                                viewModel.getNextPage()
                            }
                        }
                }
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    EventListView()
}
