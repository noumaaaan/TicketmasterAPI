//
//  SectionHeaderView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 21/05/2024.
//

import SwiftUI

struct SectionHeaderView: View {
    let section: TMSection
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(section.segment?.name ?? "")
                    .font(.headline.bold())
                    .lineLimit(1)
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal)
        .frame(height: 50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.init(hex: "00224D"))
//        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    SectionHeaderView(section: MockData().testSection)
}
