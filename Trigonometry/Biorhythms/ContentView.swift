//
//  ContentView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 8.07.22.
//

import SwiftUI

struct ContentView: View {
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
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { value in
                        withAnimation(.easeInOut(duration: 1)) {
                            if dragAmount.width > 0 {
                                physicalRhythm.firstDay -= 10
                                emotionalRhythm.firstDay -= 10
                                intellectualRhythm.firstDay -= 10
                                overallRhythm.firstDay -= 10
                            } else {
                                physicalRhythm.firstDay += 10
                                emotionalRhythm.firstDay += 10
                                intellectualRhythm.firstDay += 10
                                overallRhythm.firstDay += 10
                            }
                        }
                    }
            )
            
            Toggle("Show General", isOn: $showOverallRhytm)
                .padding(10)
            
            BiorhythmsLegendView(physicalRhythm: $physicalRhythm, emotionalRhythm: $emotionalRhythm, intellectualRhythm: $intellectualRhythm, overallRhythm: $overallRhythm, showOverallRhythm: showOverallRhytm)
                .padding(10)
        } // end of external VStack
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
