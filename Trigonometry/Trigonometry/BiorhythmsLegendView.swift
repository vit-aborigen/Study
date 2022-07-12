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
        HStack(spacing: 20) {
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

struct CircleWaveView: View {
    @State private var waveOffset = Angle(degrees: 0)
    let rhythmPercent: Int
    var color: Color = .black
    
    var fudgePercent: Int {
        (rhythmPercent + 100) / 2
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Text("\(self.rhythmPercent)%")
                    .font(Font.system(size: 0.25 * min(geo.size.width, geo.size.height) ))
                Circle()
                    .stroke(color, lineWidth: 0.025 * min(geo.size.width, geo.size.height))
                    .overlay(
                        Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(fudgePercent)/100)
                            .fill(color.opacity(0.5))
                            .clipShape(Circle().scale(0.92))
                    )
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
            self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}

struct BiorhythmsLegendView_Previews: PreviewProvider {
    static var previews: some View {
        BiorhythmsLegendView(physicalRhythm: Biorhythm(type: .physical, name: "Physical"), emotionalRhythm: Biorhythm(type: .emotional, name: "Emotional"), intellectualRhythm: Biorhythm(type: .intellectual, name: "Intellectual"), overallRhythm: Biorhythm(type: .overall, name: "Overall"), showOverallRhythm: true)
    }
}
