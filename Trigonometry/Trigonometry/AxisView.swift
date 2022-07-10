//
//  AxisView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 9.07.22.
//

import SwiftUI

struct AxisView: View {
    let today = Date()
    var values = { (range: Int) -> [String] in
        var result = Array<String> ()
        let postfix = " July"
        for day in 1...range {
            result.append("\(day)" + postfix)
        }
        return result
    }
    
    var body: some View {
        VStack {
            ZStack {
                Axis()
                    .stroke(.black, lineWidth: 1)
                    .opacity(0.5)
                
                VStack {
                    Text("100 %")
                    
                    Spacer()
                    
                    Text("-100 %")
                }
                .font(.caption2)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(0)
            
            HStack {
                ForEach(values(30), id: \.self) {
                    Text("\($0)")
                        .font(.caption2)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct AxisView_Previews: PreviewProvider {
    static var previews: some View {
        AxisView()
    }
}
