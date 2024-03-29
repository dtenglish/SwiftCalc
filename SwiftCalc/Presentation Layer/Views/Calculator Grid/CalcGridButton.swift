//
//  CalcGridButton.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/7/22.
//

import SwiftUI

//MARK: - GLOBAL ENUMS

enum ButtonType { case extraFunction, operation, pinpad, blank }

enum ButtonLabel: String {
    case clear = "C", allClear = "AC", negate = "plus.forwardslash.minus", percentage = "percent", divide = "divide", seven = "7", eight = "8", nine = "9", multiply = "multiply", four = "4", five = "5", six = "6", subtract = "minus", one = "1", two = "2", three = "3", add = "plus", zero = "0", blank = "clear", decimal = ".", equals = "equal"
}

//MARK: - STRUCT

struct CalcGridButton {
    
    //MARK: - PROPERTIES
    
    let label: ButtonLabel
    let type: ButtonType
    let theme: Theme
    let isSelected: Bool
    
    var backgroundColor: Color {
        switch type {
        case .blank:
            return Color(.clear)
        case .extraFunction:
            return theme.extraFunctionColor
        case .pinpad:
            return theme.pinpadColor
        case .operation:
            if isSelected {
                return theme.operationSelectedColor
            } else {
                return theme.operationColor
            }
        }
    }
    
    var textColor: Color {
        switch type {
        case .blank:
            return Color(.clear)
        case .extraFunction:
            return theme.extraFunctionTextColor
        case .pinpad:
            return theme.pinpadTextColor
        case .operation:
            if isSelected {
                return theme.operationTextSelectedColor
            } else {
                return theme.operationTextColor
            }
        }
    }
}
