//
//  CalcGridButton.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/7/22.
//

import SwiftUI

struct CalcGridButton {
    let label: String
    let type: String
    var theme: CalculatorTheme
    
    var backgroundColor: Color {
        switch type {
        case "extraFunction":
            return theme.extraFunctionColor
        case "operation":
            return theme.operationColor
        case "pinpad":
            return theme.pinpadColor
        default:
            return Color(.white).opacity(0)
        }
    }
    var textColor: Color {
        switch type {
        case "extraFunction":
            return theme.extraFunctionTextColor
        case "operation":
            return theme.operationTextColor
        case "pinpad":
            return theme.pinpadTextColor
        default:
            return Color(.white).opacity(0)
        }
    }
}
