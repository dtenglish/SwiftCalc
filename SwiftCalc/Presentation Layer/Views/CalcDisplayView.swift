//
//  CalcDisplayView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalcDisplayView: View {
    //MARK: - PROPERTIES
    @State var calcDisplayText: String = "0"
    
    //MARK: - BODY
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Text(calcDisplayText)
                    .padding()
                    .font(.system(size: 80))
            } //: HSTACK
            .frame(maxWidth: .infinity)
            .padding()
        } //: ZSTACK
    }
}

