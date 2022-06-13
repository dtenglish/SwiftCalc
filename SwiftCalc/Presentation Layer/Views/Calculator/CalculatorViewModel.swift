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
    @Published var selectedTheme: Theme
    
    private let themes = CalculatorThemes().themes
    private var selectedThemeIndex: Int = 0
    
    init() {
        selectedTheme = themes[selectedThemeIndex]
        formatDisplayValue()
    }
    
    //MARK: - FUNCTIONS
    
    func buttonPressed(_ button: CalcGridButton) {
        
        if button.type == ButtonType.pinpad {
            if button.label != ButtonLabel.decimal {
                calculatorEngine.numberPressed(input: button.label)
            } else  {
                calculatorEngine.decimalPressed()
            }
            
        } else if button.type == ButtonType.operation {
            
            calculatorEngine.operationPressed(input: button.label)
            
        } else if button.type == ButtonType.extraFunction {
            
            if button.label == ButtonLabel.clear {
                calculatorEngine.clearPressed()
            } else if button.label == ButtonLabel.negate {
                calculatorEngine.negatePressed()
            } else if button.label == ButtonLabel.percentage {
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
    
    func changeTheme() {
        
        if selectedThemeIndex < (themes.count - 1) {
            selectedThemeIndex += 1
        } else {
            selectedThemeIndex = 0
        }
        
        selectedTheme = themes[selectedThemeIndex]
        
    }
    
}
