//
//  CalcMenu.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/17/22.
//

import SwiftUI

struct CalcMenu: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel: CalculatorViewModel
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Button {
                viewModel.copyDisplayValue()
            } label: {
                Text("Copy")
            }
            Button {
                viewModel.pasteValue()
            } label: {
                Text("Paste")
            }
        } //: VSTACK
    }
}
