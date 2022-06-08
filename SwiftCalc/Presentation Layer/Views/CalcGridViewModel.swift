//
//  CalcGridViewModel.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

class CalcGridViewModel: ObservableObject {
    //MARK: - PROPERTIES
    private var themes = ColorThemes()
    var buttons: [CalcGridButton]?
    
    typealias input = (label: String, type: String)
    
    let inputs = [
        (label: "AC", type: "extraFunction"),
        (label: "+/-", type: "extraFunction"),
        (label: "%", type: "extraFunction"),
        (label: "/", type: "operation"),
        (label: "7", type: "pinpad"),
        (label: "8", type: "pinpad"),
        (label: "9", type: "pinpad"),
        (label: "X", type: "operation"),
        (label: "4", type: "pinpad"),
        (label: "5", type: "pinpad"),
        (label: "6", type: "pinpad"),
        (label: "-", type: "operation"),
        (label: "1", type: "pinpad"),
        (label: "2", type: "pinpad"),
        (label: "3", type: "pinpad"),
        (label: "+", type: "operation"),
        (label: "0", type: "pinpad"),
        (label: "nil", type: "nil"),
        (label: ".", type: "pinpad"),
        (label: "=", type: "operation"),
    ]
    
    init() {
        buttons = generateButtons(inputs: inputs, theme: themes.selectedTheme)
    }
    
    //MARK: - FUNCTIONS
    
    func generateButtons(inputs: [input], theme: CalculatorTheme) -> [CalcGridButton] {
        var buttons: [CalcGridButton] = []
        
        for input in inputs {
            buttons.append(
                CalcGridButton(label: input.label, type: input.type, theme: theme)
            )
        }
        
        return buttons
    }
    
    func buttonPressed(_ label: String) {
        print(label)
    }
}
