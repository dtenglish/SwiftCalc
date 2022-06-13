//
//  CalcGridButton.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/7/22.
//

import SwiftUI

enum ButtonType { case extraFunction, operation, pinpad, blank }

enum ButtonLabel: String {
    case clear = "AC", negate = "+/-", percentage = "%", divide = "/", seven = "7", eight = "8", nine = "9", multiply = "X", four = "4", five = "5", six = "6", subtract = "-", one = "1", two = "2", three = "3", add = "+", zero = "0", blank = "nil", decimal = ".", equals = "="
}

struct CalcGridButton {
    
    let label: ButtonLabel
    var type: ButtonType
    var theme: Theme
    
    var backgroundColor: Color {
        switch type {
        case .extraFunction:
            return theme.extraFunctionColor
        case .operation:
            return theme.operationColor
        case .pinpad:
            return theme.pinpadColor
        case .blank:
            return Color(.white).opacity(0)
        }
    }
    
    var textColor: Color {
        switch type {
        case .extraFunction:
            return theme.extraFunctionTextColor
        case .operation:
            return theme.operationTextColor
        case .pinpad:
            return theme.pinpadTextColor
        case .blank:
            return Color(.white).opacity(0)
        }
    }
}
