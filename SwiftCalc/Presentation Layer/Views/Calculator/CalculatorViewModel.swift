//
//  CalculatorViewModel.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/8/22.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {
    //MARK: - PROPERTIES
    
    var calculatorEngine = CalculatorEngine()
    @Published var displayValue: Decimal = 0
    
    
    //MARK: - FUNCTIONS
    
    func buttonPressed(_ button: CalcGridButton) {
        if button.type == CalcGridButton.ButtonType.pinpad {
            if let input = Decimal(string: button.label) {
                calculatorEngine.numberPressed(input)
                displayValue = calculatorEngine.currentValue
            } else if button.label == "." {
                calculatorEngine.decimalPressed()
            }
        } else if button.type == CalcGridButton.ButtonType.operation {
            switch button.label {
            case "+": calculatorEngine.addPressed()
            case "-": calculatorEngine.subtractPressed()
            case "X": calculatorEngine.multiplyPressed()
            default: return
            }
        } else if button.type == CalcGridButton.ButtonType.extraFunction {
            
        }
    }
}
