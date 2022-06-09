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
    
    var lhs: Decimal
    var rhs: Decimal?
    var operation: OperationType?
    var result: Decimal?
    
    //MARK: - FUNCTIONS
    mutating func execute() {
        guard
            let rhs = self.rhs,
            let operation = self.operation else {
                return
        }
        
        switch operation {
        case .add:
            result = lhs + rhs
        case .subtract:
            result = lhs - rhs
        case .multiply:
            result = lhs * rhs
        case .divide:
            result = lhs / rhs
        }
    }
}
