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
    
    @State private var dragAmount = CGSize.zero
    @State private var scrolledAmountInDays = 0.0
    
    var body: some View {
        GeometryReader { geo in
            VStack (spacing: 0) {
                ZStack {
                    AxisView(biorhythm: physicalRhythm)
                    
                    Rhythm(biorhytm: physicalRhythm)
                        .stroke(.green, lineWidth: 2)
                    
                    Rhythm(biorhytm: emotionalRhythm)
                        .stroke(.pink, lineWidth: 2)
                    
                    Rhythm(biorhytm: intellectualRhythm)
                        .stroke(.blue, lineWidth: 2)
                    
                    Rhythm(biorhytm: overallRhythm)
                        .stroke(.purple, lineWidth: 3)
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.easeOut) {
                                dragAmount = value.translation
                                let transitionConvertedToDays = round(dragAmount.width / geo.size.width * Double(physicalRhythm.distance))
                                
                                if transitionConvertedToDays != scrolledAmountInDays {
                                    physicalRhythm.firstDay -= transitionConvertedToDays - scrolledAmountInDays
                                    emotionalRhythm.firstDay -= transitionConvertedToDays - scrolledAmountInDays
                                    intellectualRhythm.firstDay -= transitionConvertedToDays - scrolledAmountInDays
                                    overallRhythm.firstDay -= transitionConvertedToDays - scrolledAmountInDays
                                    
                                    scrolledAmountInDays = transitionConvertedToDays
                                }
                            }
                        }
                        .onEnded { _ in
                            scrolledAmountInDays = 0.0
                        }
                )
                
                XAxisLegendView(biorhythm: $physicalRhythm)
                    .frame(maxWidth: geo.size.width)
                
                Text("Your state on " + DateHelper.getAxisNamesForDay(for: physicalRhythm.firstDay + 3.0))
                    .font(.title)
                    .padding(.top, 10)
                
                Spacer()
                
                BiorhythmsLegendView(physicalRhythm: $physicalRhythm, emotionalRhythm: $emotionalRhythm, intellectualRhythm: $intellectualRhythm, overallRhythm: $overallRhythm)
            }
        } // geo visibility zone
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
