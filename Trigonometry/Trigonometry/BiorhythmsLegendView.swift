//
//  BiorythmsLegendView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import SwiftUI

struct BiorhythmsLegendView: View {
    // 2DO https://stackoverflow.com/questions/63397067/fill-circle-with-wave-animation-in-swiftui
    
    var biorhythms: [Biorhythm]
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(biorhythms[0].returnPercent())
                    Text(biorhythms[2].returnPercent())
                }
                
                Spacer()
                
                Circle()
                    .stroke(.red, lineWidth: 3)
            }
            
            Spacer()
            
            HStack {
                Circle()
                    .stroke(.green, lineWidth: 3)
                
                Spacer()
                
                Circle()
                    .stroke(.blue, lineWidth: 3)
            }
        }
    }
}

struct BiorhythmsLegendView_Previews: PreviewProvider {
    static var previews: some View {
        BiorhythmsLegendView(biorhythms: [Biorhythm(type: .intellectual)])
    }
}
