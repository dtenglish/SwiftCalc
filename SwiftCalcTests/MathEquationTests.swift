//
//  MatchEquationTests.swift
//  MatchEquationTests
//
//  Created by Daniel Taylor English on 6/6/22.
//

import XCTest
@testable import SwiftCalc

class MatchEquationTests: XCTestCase {

    func testAddition() throws {
        var mathEquation = MathEquation(leftSide: .zero)
        
        mathEquation.leftSide = 4
        mathEquation.operation = .add
        mathEquation.rightSide = 6
        mathEquation.execute()
        
        let expectedResult = Decimal(10)
        
        XCTAssertTrue(mathEquation.result == expectedResult)
    }
    
    func testSubtraction() throws {
        var mathEquation = MathEquation(leftSide: .zero)
        
        mathEquation.leftSide = 10
        mathEquation.operation = .subtract
        mathEquation.rightSide = 6
        mathEquation.execute()
        
        let expectedResult = Decimal(4)
        
        XCTAssertTrue(mathEquation.result == expectedResult)
    }

    func testMultiplication() throws {
        var mathEquation = MathEquation(leftSide: .zero)
        
        mathEquation.leftSide = 4
        mathEquation.operation = .multiply
        mathEquation.rightSide = 6
        mathEquation.execute()
        
        let expectedResult = Decimal(24)
        
        XCTAssertTrue(mathEquation.result == expectedResult)
    }

    func testDivision() throws {
        var mathEquation = MathEquation(leftSide: .zero)
        
        mathEquation.leftSide = 64
        mathEquation.operation = .divide
        mathEquation.rightSide = 8
        mathEquation.execute()
        
        let expectedResult = Decimal(8)
        
        XCTAssertTrue(mathEquation.result == expectedResult)
    }

}
