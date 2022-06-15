//
//  CalcGridView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalcGridView: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel: CalculatorViewModel
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
            if let grid = CalcGrid(viewModel: viewModel) {
                if let buttons = grid.buttons {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                        ForEach(0..<20) { i in
                                CalcGridButtonView(
                                    button: buttons[i],
                                    width: i == 16 ? (availableWidth / 2 - 24) : (availableWidth / 4 - 16),
                                    height: (availableWidth / 4 - 16),
                                    action: {viewModel.buttonPressed(buttons[i])}
                                )
                        }
                    } //: VGRID
                }
            }
        } //: VSTACK
        .padding(.horizontal)
        .padding(.bottom, 10)
        .readSize { size in
          availableWidth = size.width
        }
    }
}
