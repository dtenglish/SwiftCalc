//
//  CalculatorEngine.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/8/22.
//

import Foundation

enum ClearButtonState { case clearCurrent, clearAll }

struct CalculatorEngine {
    //MARK: - PROPERTIES
    
    enum OperandSide { case leftHandSide, rightHandSide }
    
    private var mathEquation = MathEquation(lhs: 0)
    private var operandSide = OperandSide.leftHandSide
    private var activeOperation = false
    private var startNewInput = true
    private var isComplete = false
    private var decimalMultiplier: Decimal = 1
    private(set) var clearButtonState = ClearButtonState.clearAll
    private(set) var decimalButtonActive = false
    private(set) var decimalSpaces: Int = 0
    var currentValue: Decimal = 0
    var displayValue: Decimal = 0
    
    //MARK: - EXTRA FUNCTIONS
    
    mutating func clearPressed() {
        if clearButtonState == ClearButtonState.clearAll {
            resetCalc()
        } else if clearButtonState == ClearButtonState.clearCurrent {
            clearCurrentValue()
            clearButtonState = ClearButtonState.clearAll
        }
    }
    
    mutating func negatePressed() {
        displayValue.negate()
        startNewInput = true
        decimalButtonActive = false

        if operandSide == OperandSide.rightHandSide {
            mathEquation.lhs = displayValue
        } else if operandSide == OperandSide.leftHandSide {
            currentValue = displayValue
        }
    }
    
    mutating func percentagePressed() {
        displayValue = displayValue * 0.01
        startNewInput = true
        decimalButtonActive = false
        
        if operandSide == OperandSide.rightHandSide {
            mathEquation.lhs = displayValue
        } else if operandSide == OperandSide.leftHandSide {
            currentValue = displayValue
        }
    }
    
    //MARK: - OPERATIONS
    
    mutating func operationPressed(input: ButtonLabel) {
        
        switch operandSide {
        case .leftHandSide:
            mathEquation.lhs = currentValue
            operandSide = .rightHandSide
        case .rightHandSide:
            mathEquation.rhs = currentValue
            isComplete = false
            
            if activeOperation {
                mathEquation.execute()
                activeOperation = false
            }
            
        }
        
        switch input {
        case ButtonLabel.add: mathEquation.operation = .add
        case ButtonLabel.subtract: mathEquation.operation = .subtract
        case ButtonLabel.multiply: mathEquation.operation = .multiply
        case ButtonLabel.divide: mathEquation.operation = .divide
        case ButtonLabel.equals:
            mathEquation.execute()
            activeOperation = false
            isComplete = true
        default:
            break
        }
        
        if let result = mathEquation.result {
            displayValue = result
            
            mathEquation = MathEquation(lhs: result, operation: mathEquation.operation)
            
            activeOperation = false
        }
        
        startNewInput = true
        decimalButtonActive = false
        
    }
    
    //MARK: - PINPAD
    
    mutating func numberPressed(input: ButtonLabel) {
        
        if let number = Decimal(string: input.rawValue) {
            
            if isComplete {
                resetCalc()
            }
            
            if clearButtonState == ClearButtonState.clearAll {
                clearButtonState = ClearButtonState.clearCurrent
            }
            
            if startNewInput {
                currentValue = 0
                decimalButtonActive = false
                decimalSpaces = 0
                decimalMultiplier = 1
                startNewInput = false
            }
            
            if currentValue.description.count < 9 {
                if decimalButtonActive {
                    currentValue = currentValue + (number / (decimalMultiplier * 10))
                    decimalMultiplier *= 10
                    decimalSpaces += 1
                } else {
                    currentValue = (currentValue * 10) + number
                }
            }
            
            displayValue = currentValue
            
            if operandSide == .rightHandSide && activeOperation == false {
                activeOperation = true
            }
        }
        
    }
    
    mutating func decimalPressed() {
        decimalButtonActive = true
        
        if startNewInput {
            currentValue = 0
            decimalSpaces = 0
            decimalMultiplier = 1
            startNewInput = false
        }
        
        displayValue = currentValue
    }
    
    //MARK: - UTILITY FUNCTIONS
    
    mutating func clearCurrentValue() {
        currentValue = 0
        displayValue = 0
        startNewInput = true
        decimalButtonActive = false
        decimalMultiplier = 1
        decimalSpaces = 0
    }
    
    mutating func resetCalc() {
        mathEquation = MathEquation(lhs: 0)
        currentValue = 0
        displayValue = 0
        operandSide = .leftHandSide
        activeOperation = false
        startNewInput = true
        isComplete = false
        decimalButtonActive = false
        decimalMultiplier = 1
        decimalSpaces = 0
    }
    
    mutating func inputValue(value: Decimal) {
        currentValue = value
        displayValue = value
        startNewInput = true
    }
}
