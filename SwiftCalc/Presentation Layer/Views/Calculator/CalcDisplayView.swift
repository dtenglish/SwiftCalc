//
//  CalcDisplayView.swift
//  SwiftCalc
//
//  Created by Daniel Taylor English on 6/6/22.
//

import SwiftUI

struct CalcDisplayView: View {
    //MARK: - PROPERTIES
    @Binding var displayValueString: String
    
    //MARK: - BODY
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Text(displayValueString)
                    .padding()
                    .font(.system(size: 80))
            } //: HSTACK
            .frame(maxWidth: .infinity)
            .padding()
        } //: ZSTACK
    }
}

//struct CalcDisplayOutput {
//    let output: Decimal
//}
//
//extension CalcDisplayOutput: CustomStringConvertible {
//    var description: String {
//        return String(output)
//    }
//}
