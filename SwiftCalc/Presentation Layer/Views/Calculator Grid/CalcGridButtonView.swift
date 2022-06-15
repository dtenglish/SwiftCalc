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
            Text(button.label.rawValue)
                .font(.title2)
                .fontWeight(.semibold)
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

