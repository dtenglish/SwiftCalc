//
//  MathEquation.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/8/22.
//

import Foundation

struct MathEquation {
    //MARK: - PROPERTIES
    enum OperationType { case add, subtract, multiply, divide }
    
    var leftSide: Decimal
    var rightSide: Decimal?
    var operation: OperationType?
    var result: Decimal?
    
    //MARK: - FUNCTIONS
    mutating func execute() {
        guard
            let rightSide = self.rightSide,
            let operation = self.operation else {
                return
        }
        
        switch operation {
        case .add:
            result = leftSide + rightSide
        case .subtract:
            result = leftSide - rightSide
        case .multiply:
            result = leftSide * rightSide
        case .divide:
            result = leftSide / rightSide
        }
    }
}
