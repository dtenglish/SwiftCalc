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
            if let grid = CalcGrid(theme: viewModel.selectedTheme) {
                if let buttons = grid.buttons {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 5) {
                        ForEach(0..<20) { i in
                                CalcGridButtonView(
                                    button: buttons[i],
                                    width: i == 16 ? (availableWidth / 2 - 15) : (availableWidth / 4 - 10),
                                    height: (availableWidth / 4 - 10),
                                    action: {viewModel.buttonPressed(buttons[i])}
                                )
                        }
                    } //: VGRID
                }
            }
        } //: VSTACK
        .padding(.horizontal)
        .readSize { size in
          availableWidth = size.width
        }
    }
}
