//
//  CalcGridButton.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/7/22.
//

import SwiftUI

struct CalcGridButton {
    enum ButtonType { case extraFunction, operation, pinpad, blank }
    
    let label: String
    var type: ButtonType
    var theme: CalculatorTheme
    
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
