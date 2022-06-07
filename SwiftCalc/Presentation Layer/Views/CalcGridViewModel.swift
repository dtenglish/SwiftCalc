//
//  CalcGridViewModel.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

class CalcGridViewModel: ObservableObject {
    //MARK: - PROPERTIES
    
    let buttons: [CalcGridButton] = [
        CalcGridButton(label: "AC", backgroundColor: Color(.systemGray), textColor: Color(.white)),
        CalcGridButton(label: "+/-", backgroundColor: Color(.systemGray), textColor: Color(.white)),
        CalcGridButton(label: "%", backgroundColor: Color(.systemGray), textColor: Color(.white)),
        CalcGridButton(label: "/", backgroundColor: Color(.darkGray), textColor: Color(.white)),
        CalcGridButton(label: "7", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "8", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "9", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "X", backgroundColor: Color(.darkGray), textColor: Color(.white)),
        CalcGridButton(label: "4", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "5", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "6", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "-", backgroundColor: Color(.darkGray), textColor: Color(.white)),
        CalcGridButton(label: "1", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "2", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "3", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "+", backgroundColor: Color(.darkGray), textColor: Color(.white)),
        CalcGridButton(label: "0", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "", backgroundColor: Color(.white), textColor: Color(.white)),
        CalcGridButton(label: ".", backgroundColor: Color(.systemBlue), textColor: Color(.white)),
        CalcGridButton(label: "=", backgroundColor: Color(.darkGray), textColor: Color(.white)),
        
    ]
    
    //MARK: - FUNCTIONS
    
    func buttonPressed(_ label: String) {
        print(label)
    }
}
