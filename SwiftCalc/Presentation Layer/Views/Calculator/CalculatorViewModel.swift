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
    private(set) var selectedOperation: ButtonLabel?
    private var displayScientificNotation = false
    
    init() {
        selectedTheme = themes[selectedThemeIndex]
        formatDisplayValue()
    }
    
    //MARK: - FUNCTIONS
    
    func buttonPressed(_ button: CalcGridButton) {
        
        if button.type == ButtonType.pinpad {
            
            if selectedOperation != nil {
                selectedOperation = nil
            }
            
            if button.label != ButtonLabel.decimal {
                calculatorEngine.numberPressed(input: button.label)
            } else  {
                calculatorEngine.decimalPressed()
            }
            
        } else if button.type == ButtonType.operation {
            
            if selectedOperation != nil {
                selectedOperation = nil
            }
            
            calculatorEngine.operationPressed(input: button.label)
            
            if button.label != ButtonLabel.equals {
                selectedOperation = button.label
            }
            
        } else if button.type == ButtonType.extraFunction {
            
            if button.label == ButtonLabel.clear || button.label == ButtonLabel.allClear {
                calculatorEngine.clearPressed()
                selectedOperation = nil
            } else if button.label == ButtonLabel.negate {
                calculatorEngine.negatePressed()
            } else if button.label == ButtonLabel.percentage {
                calculatorEngine.percentagePressed()
            }
            
        }
        
        formatDisplayValue()
    }
    
    func formatDisplayValue() {
        
        let formatter = NumberFormatter()
        
        if calculatorEngine.displayValue.description.count > 9 {
            displayScientificNotation = true
        } else {
            displayScientificNotation = false
        }
        
        formatter.numberStyle = displayScientificNotation ? NumberFormatter.Style.scientific : NumberFormatter.Style.decimal
        formatter.maximumFractionDigits = displayScientificNotation ? 5 : 10

        let formattedString = formatter.string(from: calculatorEngine.displayValue as NSNumber) ?? "0"
        
        if formattedString == "NaN" {
            displayValueString = "Error"
        } else {
            displayValueString = formattedString
        }
        
        if calculatorEngine.decimalButtonActive && calculatorEngine.decimalSpaces == 0 {
            displayValueString.append(".")
        }
        
    }
    
    func copyDisplayValue() {
        
        UIPasteboard.general.setValue(displayValueString, forPasteboardType: "public.plain-text")
        
    }
    
    func pasteValue() {
        
        let value = UIPasteboard.general.string ?? "0"
        let result = Decimal(string: value) ?? 0
        
        calculatorEngine.inputValue(value: result)
        
        formatDisplayValue()
        
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
