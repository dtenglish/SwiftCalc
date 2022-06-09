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
            } else if button.label == "." {
                calculatorEngine.decimalPressed()
            }
            
        } else if button.type == CalcGridButton.ButtonType.operation {
            
            calculatorEngine.operationPressed(input: button.label)
            
        } else if button.type == CalcGridButton.ButtonType.extraFunction {
            
            if button.label == "AC" {
                calculatorEngine.clearPressed()
            } else if button.label == "+/-" {
                calculatorEngine.negatePressed()
            } else if button.label == "%" {
                calculatorEngine.percentagePressed()
            }
        }
        
        displayValue = calculatorEngine.displayValue
        
    }
}
