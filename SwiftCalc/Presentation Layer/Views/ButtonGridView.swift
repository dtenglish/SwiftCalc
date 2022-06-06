//
//  ButtonGridView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct ButtonGridView: View {
        
    //MARK: - PROPERTIES

    var screenWidth: CGFloat
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: - BODY
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, alignment: .leading, spacing:  5) {
                ForEach(0..<20) { i in
                    if i != 16 && i != 17 {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.systemBlue))
                                .frame(width: screenWidth / 4 - 10, height: screenWidth / 4 - 10)
                        }
                        .onTapGesture {

                        }
                    } else if i == 16 {
                        ZStack {
                            Capsule()
                                .foregroundColor(Color(.systemBlue))
                                .frame(width: screenWidth / 2 - 15, height: screenWidth / 4 - 10)
                        }
                        .zIndex(1)
                        .onTapGesture {

                        }
                    } else if i == 17 {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.white).opacity(0))
                                .frame(width: screenWidth / 4 - 10, height: screenWidth / 4 - 10)
                        }
                    }
                }
            } //: VGRID
            .padding()
        } //: VSTACK
    }
}
//
//struct ButtonGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonGridView()
//    }
//}
