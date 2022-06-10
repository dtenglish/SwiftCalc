//
//  CalcGridViewModel.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalcGrid {
    //MARK: - PROPERTIES
    private var themes = ColorThemes()
    var buttons: [CalcGridButton]?
    
    typealias input = (label: CalcGridButton.ButtonLabel, type: CalcGridButton.ButtonType)
    
    //    (label: "AC", type: CalcGridButton.ButtonType.extraFunction),
    //    (label: "+/-", type: CalcGridButton.ButtonType.extraFunction),
    //    (label: "%", type: CalcGridButton.ButtonType.extraFunction),
    //    (label: "/", type: CalcGridButton.ButtonType.operation),
    //    (label: "7", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "8", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "9", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "X", type: CalcGridButton.ButtonType.operation),
    //    (label: "4", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "5", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "6", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "-", type: CalcGridButton.ButtonType.operation),
    //    (label: "1", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "2", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "3", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "+", type: CalcGridButton.ButtonType.operation),
    //    (label: "0", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "nil", type: CalcGridButton.ButtonType.blank),
    //    (label: ".", type: CalcGridButton.ButtonType.pinpad),
    //    (label: "=", type: CalcGridButton.ButtonType.operation),
    
    let inputs = [
        (label: CalcGridButton.ButtonLabel.clear, type: CalcGridButton.ButtonType.extraFunction),
        (label: CalcGridButton.ButtonLabel.negate, type: CalcGridButton.ButtonType.extraFunction),
        (label: CalcGridButton.ButtonLabel.percentage, type: CalcGridButton.ButtonType.extraFunction),
        (label: CalcGridButton.ButtonLabel.divide, type: CalcGridButton.ButtonType.operation),
        (label: CalcGridButton.ButtonLabel.seven, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.eight, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.nine, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.multiply, type: CalcGridButton.ButtonType.operation),
        (label: CalcGridButton.ButtonLabel.four, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.five, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.six, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.subtract, type: CalcGridButton.ButtonType.operation),
        (label: CalcGridButton.ButtonLabel.one, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.two, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.three, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.add, type: CalcGridButton.ButtonType.operation),
        (label: CalcGridButton.ButtonLabel.zero, type: CalcGridButton.ButtonType.pinpad),
        (label: CalcGridButton.ButtonLabel.blank, type: CalcGridButton.ButtonType.blank),
        (label: CalcGridButton.ButtonLabel.decimal, type: CalcGridButton.ButtonType.pinpad),
         (label: CalcGridButton.ButtonLabel.equals, type: CalcGridButton.ButtonType.operation),
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
}