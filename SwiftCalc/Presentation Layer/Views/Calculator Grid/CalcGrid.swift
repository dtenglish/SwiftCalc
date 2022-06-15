//
//  CalcGridViewModel.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalcGrid {
    //MARK: - PROPERTIES
    var buttons: [CalcGridButton]?
    
    typealias input = (label: ButtonLabel, type: ButtonType)
    
    let inputs = [
        (label: ButtonLabel.clear, type: ButtonType.extraFunction),
        (label: ButtonLabel.negate, type: ButtonType.extraFunction),
        (label: ButtonLabel.percentage, type: ButtonType.extraFunction),
        (label: ButtonLabel.divide, type: ButtonType.operation),
        (label: ButtonLabel.seven, type: ButtonType.pinpad),
        (label: ButtonLabel.eight, type: ButtonType.pinpad),
        (label: ButtonLabel.nine, type: ButtonType.pinpad),
        (label: ButtonLabel.multiply, type: ButtonType.operation),
        (label: ButtonLabel.four, type: ButtonType.pinpad),
        (label: ButtonLabel.five, type: ButtonType.pinpad),
        (label: ButtonLabel.six, type: ButtonType.pinpad),
        (label: ButtonLabel.subtract, type: ButtonType.operation),
        (label: ButtonLabel.one, type: ButtonType.pinpad),
        (label: ButtonLabel.two, type: ButtonType.pinpad),
        (label: ButtonLabel.three, type: ButtonType.pinpad),
        (label: ButtonLabel.add, type: ButtonType.operation),
        (label: ButtonLabel.zero, type: ButtonType.pinpad),
        (label: ButtonLabel.blank, type: ButtonType.blank),
        (label: ButtonLabel.decimal, type: ButtonType.pinpad),
        (label: ButtonLabel.equals, type: ButtonType.operation),
    ]
    
    init(viewModel: CalculatorViewModel) {
        buttons = generateButtons(inputs: inputs, theme: viewModel.selectedTheme, selectedOperation: viewModel.selectedOperation)
    }
    
    //MARK: - FUNCTIONS
    
    func generateButtons(inputs: [input], theme: Theme, selectedOperation: ButtonLabel?) -> [CalcGridButton] {
        var buttons: [CalcGridButton] = []
        
        for input in inputs {
            buttons.append(
                CalcGridButton(label: input.label, type: input.type, theme: theme, isSelected: selectedOperation == input.label ? true : false)
            )
        }
        
        return buttons
    }
    
    
}
