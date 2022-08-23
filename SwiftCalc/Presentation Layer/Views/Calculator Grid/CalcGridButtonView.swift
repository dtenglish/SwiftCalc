//
//  CalcGridButtonView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalcGridButtonView: View {
    //MARK: - PROPERTIES
    @State private var isTapped = false
    
    let button: CalcGridButton
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(button.backgroundColor.opacity(isTapped ? 0 : 1))
                .frame(width: width, height: height)
            ZStack{
                if button.type == ButtonType.pinpad || button.label == ButtonLabel.clear || button.label == ButtonLabel.allClear {
                    Text(button.label.rawValue)
                } else {
                    Image(systemName: button.label.rawValue)
                }
            } //: ZSTACK
            .font(.system(size: 30, weight: .semibold))
            .foregroundColor(button.textColor)
        }
        .scaleEffect(isTapped ? 1.1 : 1)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isTapped = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                     isTapped = false
                }
            }
            
            action()
         }
    }
}

