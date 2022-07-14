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
    @State private var rhythmCanvasSize = CGSize.zero
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        GeometryReader { geo in
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
                    .onChanged { value in
                        withAnimation(.easeOut) {
                            dragAmount = value.translation
                            
                            let transitionConvertedToDays = round(dragAmount.width / geo.size.width * Double(physicalRhythm.distance))
                            print("before", dragAmount.width, transitionConvertedToDays, physicalRhythm.firstDay)
                            
                            physicalRhythm.firstDay -= transitionConvertedToDays
                            emotionalRhythm.firstDay -= transitionConvertedToDays
                            intellectualRhythm.firstDay -= transitionConvertedToDays
                            overallRhythm.firstDay -= transitionConvertedToDays
                            
                            dragAmount = CGSize.zero
                            print("after", dragAmount.width, transitionConvertedToDays, physicalRhythm.firstDay)
                            
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
