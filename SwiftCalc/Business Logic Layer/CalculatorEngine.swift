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
    private var startNewInput = true
    private var isComplete = false
    
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
    }
    
    mutating func percentagePressed() {
        displayValue = displayValue * 0.01
        currentValue = displayValue
        startNewInput = true
    }
    
    //MARK: - OPERATIONS
    
    mutating func operationPressed(input: CalcGridButton.ButtonLabel) {
        
        switch operandSide {
        case .leftHandSide:
            mathEquation.lhs = currentValue
            operandSide = .rightHandSide
        case .rightHandSide:
            mathEquation.rhs = currentValue
        }
        
        isComplete = false
        
        if operandSide == .rightHandSide && startNewInput == false {
            mathEquation.execute()
        }
        
        switch input {
        case CalcGridButton.ButtonLabel.add: mathEquation.operation = .add
        case CalcGridButton.ButtonLabel.subtract: mathEquation.operation = .subtract
        case CalcGridButton.ButtonLabel.multiply: mathEquation.operation = .multiply
        case CalcGridButton.ButtonLabel.divide: mathEquation.operation = .divide
        case CalcGridButton.ButtonLabel.equals:
            mathEquation.execute()
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
    
    mutating func numberPressed(_ input: Decimal) {
        
        if isComplete {
            resetCalc()
        }
        
        if startNewInput {
            currentValue = 0
            startNewInput = false
        }
        
        currentValue = (currentValue * 10) + input
        displayValue = currentValue
        
    }
    
    mutating func decimalPressed() {
        
    }
    
    //MARK: - UTILITY FUNCTIONS
    mutating func resetCalc() {
        mathEquation = MathEquation(lhs: 0)
        currentValue = 0
        displayValue = 0
        operandSide = .leftHandSide
        startNewInput = true
        isComplete = false
    }
}
