//
//  CalcGridView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalcGridView: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel = CalcGridViewModel()
    @State private var availableWidth: CGFloat = 0
    
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
                            Capsule()
                                .foregroundColor(viewModel.buttons[i].backgroundColor)
                                .frame(width: availableWidth / 4 - 10, height: availableWidth / 4 - 10)
                            Text(viewModel.buttons[i].label)
                                .foregroundColor(viewModel.buttons[i].textColor)
                        }
                        .onTapGesture {
                            viewModel.buttonPressed(viewModel.buttons[i].label)
                        }
                    } else if i == 16 {
                        ZStack {
                            Capsule()
                                .foregroundColor(viewModel.buttons[i].backgroundColor)
                                .frame(width: availableWidth / 2 - 15, height: availableWidth / 4 - 10)
                            Text(viewModel.buttons[i].label)
                                .foregroundColor(viewModel.buttons[i].textColor)
                        }
                        .zIndex(1)
                        .onTapGesture {
                            viewModel.buttonPressed(viewModel.buttons[i].label)
                        }
                    } else if i == 17 {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.white).opacity(0))
                                .frame(width: availableWidth / 4 - 10, height: availableWidth / 4 - 10)
                            Text("")
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
