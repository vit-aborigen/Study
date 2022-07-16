//
//  CircleWaveView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 13.07.22.
//

import SwiftUI

struct CircleWaveView: View {
    @State private var waveOffset = Angle(degrees: 0)
    let rhythmPercent: Int
    var color: Color = .primary
    
    var fudgePercent: Int { (rhythmPercent + 100) / 2 }
    
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

struct CircleWaveView_Previews: PreviewProvider {
    static var previews: some View {
        CircleWaveView(rhythmPercent: 50, color: .blue)
    }
}
