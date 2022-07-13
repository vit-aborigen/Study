//
//  ContentView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 8.07.22.
//

import SwiftUI

struct ContentView: View {
    @State private var firstDate = 123
    @State private var physicalRhythm = Biorhythm(type: .physical, name: "Physical")
    @State private var emotionalRhythm = Biorhythm(type: .emotional, name: "Emotional")
    @State private var intellectualRhythm = Biorhythm(type: .intellectual, name: "Intellectual")
    @State private var overallRhythm = Biorhythm(type: .overall, name: "General")
    
    @State private var showOverallRhytm = true
    @State private var dragAmount = CGSize.zero
    
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
            .onTapGesture {
                physicalRhythm.firstDay += 1
                emotionalRhythm.firstDay += 1
                intellectualRhythm.firstDay += 1
                overallRhythm.firstDay += 1
            }
            
            Toggle("Show General", isOn: $showOverallRhytm)
            
            BiorhythmsLegendView(physicalRhythm: $physicalRhythm, emotionalRhythm: $emotionalRhythm, intellectualRhythm: $intellectualRhythm, overallRhythm: $overallRhythm, showOverallRhythm: showOverallRhytm)
        } // end of external VStack
        .padding(10)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
