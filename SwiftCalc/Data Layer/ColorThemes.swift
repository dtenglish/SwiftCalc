//
//  ColorThemes.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/7/22.
//

import SwiftUI

struct ColorThemes {
    var selectedTheme: CalculatorTheme
    let lightTheme = CalculatorTheme(
        backgroundColor: Color(.white),
        displayColor: Color(.black),

        extraFunctionColor: Color(.systemGray),
        extraFunctionTextColor: Color(.white),
        
        operationColor: Color(.darkGray),
        operationTextColor: Color(.white),
        operationSelectedColor: Color(.systemCyan),
        operationTextSelectedColor: Color(.white),

        pinpadColor: Color(.systemBlue),
        pinpadTextColor: Color(.white)
    )
    
    init() {
        selectedTheme = lightTheme
    }
}
