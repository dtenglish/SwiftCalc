//
//  CalculatorViewModel.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/8/22.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    //MARK: - PROPERTIES
    
    var calculatorEngine = CalculatorEngine()
    var displayValue: Decimal = 0
    
    //MARK: - FUNCTIONS
}
