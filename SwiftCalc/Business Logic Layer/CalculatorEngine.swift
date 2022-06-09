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
    
    var currentValue: Decimal = 0
    
    
    //MARK: - EXTRA FUNCTIONS
    mutating func clearPressed() {

    }
    
    mutating func negatePressed() {

    }
    
    mutating func percentagePressed() {
        
    }
    
    //MARK: - OPERATIONS
    
    mutating func addPressed() {
        mathEquation.operation = .add
    }
    
    mutating func subtractPressed() {
        mathEquation.operation = .subtract
    }
    
    mutating func multiplyPressed() {
        mathEquation.operation = .multiply
    }
    
    mutating func dividePressed() {
        mathEquation.operation = .divide
    }
    
    mutating func equalsPressed() {
        mathEquation.execute()
    }
    
    //MARK: - PINPAD
    
    mutating func numberPressed(_ input: Decimal) {
        switch operandSide {
        case .leftHandSide:
            mathEquation.lhs = (mathEquation.lhs * 10) + input
            currentValue = mathEquation.lhs
        case .rightHandSide:
            mathEquation.rhs = (mathEquation.rhs ?? 0 * 10) + input
            currentValue = mathEquation.lhs
        }
    }
    
    mutating func decimalPressed() {
        
    }
}
