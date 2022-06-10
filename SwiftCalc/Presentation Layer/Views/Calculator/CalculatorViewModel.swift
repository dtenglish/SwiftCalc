//
//  CalculatorViewModel.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/8/22.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {
    //MARK: - PROPERTIES
    
    @Published var calculatorEngine = CalculatorEngine()
    @Published var displayValueString: String = ""
    
    init() {
        formatDisplayValue()
    }
    
    //MARK: - FUNCTIONS
    
    func buttonPressed(_ button: CalcGridButton) {
        
        if button.type == CalcGridButton.ButtonType.pinpad {
            if button.label != CalcGridButton.ButtonLabel.decimal {
                calculatorEngine.numberPressed(input: button.label)
            } else  {
                calculatorEngine.decimalPressed()
            }
            
        } else if button.type == CalcGridButton.ButtonType.operation {
            
            calculatorEngine.operationPressed(input: button.label)
            
        } else if button.type == CalcGridButton.ButtonType.extraFunction {
            
            if button.label == CalcGridButton.ButtonLabel.clear {
                calculatorEngine.clearPressed()
            } else if button.label == CalcGridButton.ButtonLabel.negate {
                calculatorEngine.negatePressed()
            } else if button.label == CalcGridButton.ButtonLabel.percentage {
                calculatorEngine.percentagePressed()
            }
        }
        
        formatDisplayValue()
    }
    
    func formatDisplayValue() {
        let decimalSpaces = String(describing: calculatorEngine.decimalSpaces)
        let displayValueDouble = Double(truncating: calculatorEngine.displayValue as NSNumber)
        
        if calculatorEngine.decimalButtonActive {
            displayValueString = String(format: "%.0\(decimalSpaces)f", displayValueDouble)
        } else {
            displayValueString = String(describing: calculatorEngine.displayValue)
        }
        
        if calculatorEngine.decimalButtonActive && calculatorEngine.decimalSpaces == 0 {
            displayValueString.append(".")
        }
    }
}
