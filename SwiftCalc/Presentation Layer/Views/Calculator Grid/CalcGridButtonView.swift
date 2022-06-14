//
//  CalcGridButtonView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalcGridButtonView: View {
    //MARK: - PROPERTIES
    let button: CalcGridButton
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(button.backgroundColor)
                .frame(width: width, height: height)
            Text(button.label.rawValue)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(button.textColor)
        }
        .onTapGesture {
            action()
        }
    }
}

