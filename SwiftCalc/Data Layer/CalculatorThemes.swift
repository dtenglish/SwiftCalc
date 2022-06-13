//
//  CalculatorThemes.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/7/22.
//

import SwiftUI

struct CalculatorThemes {
    
    let themes: [Theme]
    
    let lightTheme = Theme(
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
    
    let darkTheme = Theme(
        backgroundColor: Color(.black),
        displayColor: Color(.white),

        extraFunctionColor: Color(.systemGray),
        extraFunctionTextColor: Color(.white),
        
        operationColor: Color(.systemOrange),
        operationTextColor: Color(.white),
        operationSelectedColor: Color(.systemRed),
        operationTextSelectedColor: Color(.white),

        pinpadColor: Color(.darkGray),
        pinpadTextColor: Color(.white)
    )
    
    init() {
        themes = [lightTheme, darkTheme]
    }
    
}
