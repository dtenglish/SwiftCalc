//
//  CalculatorView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalculatorView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = CalculatorViewModel()
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                CalcDisplayView(viewModel: viewModel)
                    .onTapGesture {
                        viewModel.changeTheme()
                    }
                CalcGridView(viewModel: viewModel)
            } //: VSTACK
        } //: ZSTACK
        .background(viewModel.selectedTheme.backgroundColor)
        .preferredColorScheme(viewModel.selectedTheme.colorScheme)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
