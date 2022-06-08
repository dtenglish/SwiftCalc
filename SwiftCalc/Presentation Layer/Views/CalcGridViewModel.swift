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
    
    typealias input = (label: String, type: CalcGridButton.ButtonType)
    
    let inputs = [
        (label: "AC", type: CalcGridButton.ButtonType.extraFunction),
        (label: "+/-", type: CalcGridButton.ButtonType.extraFunction),
        (label: "%", type: CalcGridButton.ButtonType.extraFunction),
        (label: "/", type: CalcGridButton.ButtonType.operation),
        (label: "7", type: CalcGridButton.ButtonType.pinpad),
        (label: "8", type: CalcGridButton.ButtonType.pinpad),
        (label: "9", type: CalcGridButton.ButtonType.pinpad),
        (label: "X", type: CalcGridButton.ButtonType.operation),
        (label: "4", type: CalcGridButton.ButtonType.pinpad),
        (label: "5", type: CalcGridButton.ButtonType.pinpad),
        (label: "6", type: CalcGridButton.ButtonType.pinpad),
        (label: "-", type: CalcGridButton.ButtonType.operation),
        (label: "1", type: CalcGridButton.ButtonType.pinpad),
        (label: "2", type: CalcGridButton.ButtonType.pinpad),
        (label: "3", type: CalcGridButton.ButtonType.pinpad),
        (label: "+", type: CalcGridButton.ButtonType.operation),
        (label: "0", type: CalcGridButton.ButtonType.pinpad),
        (label: "nil", type: CalcGridButton.ButtonType.blank),
        (label: ".", type: CalcGridButton.ButtonType.pinpad),
        (label: "=", type: CalcGridButton.ButtonType.operation),
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
