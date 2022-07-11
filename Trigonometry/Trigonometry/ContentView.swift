//
//  ContentView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 8.07.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var rhythmBuilder = GraphBuilder()
    @State private var showOverallRhytm = false
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                VStack {
                    ZStack {
                        AxisView()
                        
                        ForEach(rhythmBuilder.biorhytms, id: \.type) { biorhythm in
                            rhythmBuilder.drawRhythm(type: biorhythm)
                                .stroke()
                            
                            if showOverallRhytm {
                                rhythmBuilder.drawRhythm(type: Biorhythm(type: .intellectual))
                                    .stroke(.red, lineWidth: 5)
                            }
                        }

                    }
                    
                    Toggle("Show Overall", isOn: $showOverallRhytm)
                        .frame(height: geo.size.height * 0.1)
                        .padding(.horizontal, 10)

                    
                    BiorhythmsLegendView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
