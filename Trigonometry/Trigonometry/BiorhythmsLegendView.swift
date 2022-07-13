//
//  BiorythmsLegendView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import SwiftUI

struct BiorhythmsLegendView: View {
    // took from https://stackoverflow.com/questions/63397067/fill-circle-with-wave-animation-in-swiftui
    
    let physicalRhythm: Biorhythm
    let emotionalRhythm: Biorhythm
    let intellectualRhythm: Biorhythm
    let overallRhythm: Biorhythm
    
    var showOverallRhythm: Bool
    
    var body: some View {
        HStack(spacing: 20) { // Replace with GridView + UIDevice.current.orientation
            VStack {
                VStack(spacing: 5) {
                    CircleWaveView(rhythmPercent: physicalRhythm.getStateInPercent(), color: .green)
                    Text(physicalRhythm.name)
                        .font(.headline.bold())
                }
                
                VStack(spacing: 5) {
                    CircleWaveView(rhythmPercent: intellectualRhythm.getStateInPercent(), color: .blue)
                    Text(intellectualRhythm.name)
                        .font(.headline.bold())
                }
            }
            
            VStack {
                VStack(spacing: 5) {
                    CircleWaveView(rhythmPercent: emotionalRhythm.getStateInPercent(), color: .pink)
                    Text(emotionalRhythm.name)
                        .font(.headline.bold())
                }
                
                VStack(spacing: 5) {
                    CircleWaveView(rhythmPercent: overallRhythm.getStateInPercent(), color: .purple)
                    Text(overallRhythm.name)
                        .font(.headline.bold())
                }
                .opacity(showOverallRhythm ? 1.0 : 0.0)
            }
        }
        .padding(10)
    }
}

struct BiorhythmsLegendView_Previews: PreviewProvider {
    static var previews: some View {
        BiorhythmsLegendView(physicalRhythm: Biorhythm(type: .physical, name: "Physical"), emotionalRhythm: Biorhythm(type: .emotional, name: "Emotional"), intellectualRhythm: Biorhythm(type: .intellectual, name: "Intellectual"), overallRhythm: Biorhythm(type: .overall, name: "Overall"), showOverallRhythm: true)
    }
}
