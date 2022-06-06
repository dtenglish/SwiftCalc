//
//  ButtonGridView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct ButtonGridView: View {
    //MARK: - PROPERTIES
    @State private var availableWidth: CGFloat = 0
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let buttonIcons: [String] = ["AC", "+/-", "%", "/", "7", "8", "9", "X", "4", "5", "6", "-", "1", "2", "3", "+", "0", "", ".", "="]
    
    //MARK: - BODY
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, alignment: .leading, spacing:  5) {
                ForEach(0..<20) { i in
                    if i != 16 && i != 17 {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.systemBlue))
                                .frame(width: availableWidth / 4 - 10, height: availableWidth / 4 - 10)
                            Text(buttonIcons[i])
                                .foregroundColor(.white)
                        }
                        .onTapGesture {

                        }
                    } else if i == 16 {
                        ZStack {
                            Capsule()
                                .foregroundColor(Color(.systemBlue))
                                .frame(width: availableWidth / 2 - 15, height: availableWidth / 4 - 10)
                            Text(buttonIcons[i])
                                .foregroundColor(.white)
                        }
                        .zIndex(1)
                        .onTapGesture {

                        }
                    } else if i == 17 {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.white).opacity(0))
                                .frame(width: availableWidth / 4 - 10, height: availableWidth / 4 - 10)
                            Text(buttonIcons[i])
                                .foregroundColor(.white)
                        }
                    }
                }
            } //: VGRID
            .padding(.horizontal)
        } //: VSTACK
        .readSize { size in
          availableWidth = size.width
        }
    }
}
