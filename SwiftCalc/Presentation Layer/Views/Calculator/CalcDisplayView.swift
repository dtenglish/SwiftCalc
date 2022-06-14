//
//  CalcDisplayView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalcDisplayView: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel: CalculatorViewModel
    
    //MARK: - BODY
    var body: some View {
        VStack{
            HStack {
                Text(viewModel.displayValueString)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: 90, alignment: .trailing)
                    .font(.system(size: 90))
                    .minimumScaleFactor(0.5)
                    .allowsTightening(true)
                    .foregroundColor(viewModel.selectedTheme.displayColor)
            } //: HSTACK
            .padding(.horizontal)
        } //: VSTACK
    }
}
