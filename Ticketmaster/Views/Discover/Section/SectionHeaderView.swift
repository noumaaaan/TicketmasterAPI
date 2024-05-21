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
        .padding(.horizontal, 5)
        .frame(height: 37)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    SectionHeaderView(section: MockData().testSection)
}
