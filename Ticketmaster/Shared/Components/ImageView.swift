//
//  ImageView.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 08/05/2024.
//

import SwiftUI

struct ImageView: View {
    var url: String?
    var width: CGFloat
    var height: CGFloat
    var backgroundColor: Color = Color.blue1
    var cornerRadius: CGFloat = 9
    var aspectRatio: ContentMode = .fill
    
    var body: some View {
        VStack {
            if let url = url {
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: aspectRatio)
                } placeholder: {
                    placeholderView
                }
            } else {
                placeholderView
            }
        }
        .frame(width: width, height: height)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension ImageView {
    var placeholderView: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 19, height: 19)
                .foregroundStyle(Color.init(hex: "074173"))
        }
        .frame(height: height)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.init(hex: "E3F4F4"))
    }
}

#Preview {
    ImageView(url: nil, width: 300, height: 200)
}
