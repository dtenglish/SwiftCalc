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
                Spacer()
                Text(viewModel.displayValueString)
                    .padding()
                    .font(.system(size: 80))
                    .foregroundColor(viewModel.selectedTheme.displayColor)
            } //: HSTACK
            .frame(maxWidth: .infinity)
            .padding()
        } //: ZSTACK
    }
}
