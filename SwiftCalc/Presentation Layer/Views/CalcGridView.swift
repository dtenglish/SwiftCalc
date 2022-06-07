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
    @State private var availableWidth: CGFloat = 320
    
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
                    if i != 16 {
                        CalcGridButtonView(button: viewModel.buttons[i], width: (availableWidth / 4 - 10), height: (availableWidth / 4 - 10), action: {viewModel.buttonPressed(viewModel.buttons[i].label)})
                    } else if i == 16 {
                        CalcGridButtonView(button: viewModel.buttons[i], width: (availableWidth / 2 - 15), height: (availableWidth / 4 - 10), action: {viewModel.buttonPressed(viewModel.buttons[i].label)})
                            .zIndex(1)
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
