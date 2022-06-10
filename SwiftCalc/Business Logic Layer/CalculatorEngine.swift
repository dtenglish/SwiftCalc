//
//  CalculatorEngine.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/8/22.
//

import Foundation

struct CalculatorEngine {
    //MARK: - PROPERTIES
    
    enum OperandSide { case leftHandSide, rightHandSide }
    
    private var mathEquation = MathEquation(lhs: 0)
    private var operandSide = OperandSide.leftHandSide
    private var activeOperation = false
    private var startNewInput = true
    private var isComplete = false
    private var decimalButtonActive = false
    private var decimalMultiplier: Decimal = 1
    
    var currentValue: Decimal = 0
    var displayValue: Decimal = 0
    
    //MARK: - EXTRA FUNCTIONS
    
    mutating func clearPressed() {
        resetCalc()
    }
    
    mutating func negatePressed() {
        displayValue.negate()
        currentValue = displayValue
        startNewInput = true
        if operandSide == .rightHandSide {
            activeOperation = true
        }
    }
    
    mutating func percentagePressed() {
        displayValue = displayValue * 0.01
        currentValue = displayValue
        startNewInput = true
        if operandSide == .rightHandSide {
            activeOperation = true
        }
    }
    
    //MARK: - OPERATIONS
    
    mutating func operationPressed(input: CalcGridButton.ButtonLabel) {
        
        switch operandSide {
        case .leftHandSide:
            mathEquation.lhs = currentValue
            operandSide = .rightHandSide
            activeOperation = true
        case .rightHandSide:
            mathEquation.rhs = currentValue
            if activeOperation {
                mathEquation.execute()
                activeOperation = false
            }
        }
        
        switch input {
        case CalcGridButton.ButtonLabel.add: mathEquation.operation = .add
        case CalcGridButton.ButtonLabel.subtract: mathEquation.operation = .subtract
        case CalcGridButton.ButtonLabel.multiply: mathEquation.operation = .multiply
        case CalcGridButton.ButtonLabel.divide: mathEquation.operation = .divide
        case CalcGridButton.ButtonLabel.equals:
            mathEquation.execute()
            activeOperation = false
            isComplete = true
        default:
            break
        }
        
        if let result = mathEquation.result {
            displayValue = result
            mathEquation.lhs = result
        }
        
        startNewInput = true
        
    }
    
    //MARK: - PINPAD
    
    mutating func numberPressed(input: CalcGridButton.ButtonLabel) {
        
        if let number = Decimal(string: input.rawValue) {
        
            if isComplete {
                resetCalc()
            }
            
            if startNewInput {
                currentValue = 0
                decimalButtonActive = false
                decimalMultiplier = 1
                startNewInput = false
            }
            
            if decimalButtonActive {
                currentValue = currentValue + (number / (decimalMultiplier * 10))
                decimalMultiplier *= 10
            } else {
                currentValue = (currentValue * 10) + number
            }
            displayValue = currentValue
        }
        
    }
    
    mutating func decimalPressed() {
        decimalButtonActive = true
    }
    
    //MARK: - UTILITY FUNCTIONS
    
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
    }
}
