//
//  ContentView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 8.07.22.
//

import SwiftUI

struct ContentView: View {
    let physicalRhythm = Biorhythm(type: .physical)
    let emotionalRhythm = Biorhythm(type: .emotional)
    let intellectualRhythm = Biorhythm(type: .intellectual)
    let overallRhythm = Biorhythm(type: .overall)
    
    @State private var showOverallRhytm = false
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    AxisView()
                    
                    Rhythm(biorhytm: physicalRhythm)
                        .stroke(.red, lineWidth: 2)
                    
                    Rhythm(biorhytm: emotionalRhythm)
                        .stroke(.green, lineWidth: 2)
                    
                    Rhythm(biorhytm: intellectualRhythm)
                        .stroke(.blue, lineWidth: 2)
                    
                    if showOverallRhytm {
                        Rhythm(biorhytm: overallRhythm)
                            .stroke(.purple, lineWidth: 4)
                    }
                }
                .padding(10)
                
                Toggle("Show Overall", isOn: $showOverallRhytm)
                    .padding(.horizontal, 10)
                
                Text(physicalRhythm.returnPercent())
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
