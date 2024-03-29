//
//  AxisView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 9.07.22.
//

import SwiftUI

struct AxisView: View {
    let biorhythm: Biorhythm
    
    var body: some View {
        VStack {
            ZStack {
                Axis(buildFor: biorhythm)
                    .stroke(lineWidth: 1)
                    .opacity(0.5)
                
                VStack {
                    Text("100 %")
                    
                    Spacer()
                    
                    Text("-100 %")
                }
                .font(.caption2)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct AxisView_Previews: PreviewProvider {
    static var previews: some View {
        AxisView(biorhythm: Biorhythm(type: .physical, name: "Test", firstDay: 1234))
    }
}
