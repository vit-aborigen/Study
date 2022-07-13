//
//  ContentView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 8.07.22.
//

import SwiftUI

struct ContentView: View {
    let physicalRhythm = Biorhythm(type: .physical, name: "Physical")
    let emotionalRhythm = Biorhythm(type: .emotional, name: "Emotional")
    let intellectualRhythm = Biorhythm(type: .intellectual, name: "Intellectual")
    let overallRhythm = Biorhythm(type: .overall, name: "General")
    
    @State private var showOverallRhytm = true
    
    var body: some View {
        VStack {
            ZStack {
                AxisView(biorhythm: physicalRhythm)
                
                Rhythm(biorhytm: physicalRhythm)
                    .stroke(.green, lineWidth: 2)
                
                Rhythm(biorhytm: emotionalRhythm)
                    .stroke(.pink, lineWidth: 2)
                
                Rhythm(biorhytm: intellectualRhythm)
                    .stroke(.blue, lineWidth: 2)
                
                if showOverallRhytm {
                    Rhythm(biorhytm: overallRhythm)
                        .stroke(.purple, lineWidth: 3)
                }
            }

            
            Toggle("Show General", isOn: $showOverallRhytm)
            
            BiorhythmsLegendView(physicalRhythm: physicalRhythm, emotionalRhythm: emotionalRhythm, intellectualRhythm: intellectualRhythm, overallRhythm: overallRhythm, showOverallRhythm: showOverallRhytm)
        } // end of external VStack
        .padding(10)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
