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
            VStack {
                ZStack {
                    AxisView()
                    
                    ForEach(rhythmBuilder.biorhytms, id: \.type) { biorhythm in
                        if biorhythm.type != .overall {
                            rhythmBuilder.drawRhythm(type: biorhythm)
                                .stroke()
                        }
                    }
                    
                    if showOverallRhytm {
                        rhythmBuilder.drawRhythm(type: Biorhythm.init(type: .overall))
                            .stroke(.red, lineWidth: 3)
                    }
                }
                .padding(10)
                
                Toggle("Show Overall", isOn: $showOverallRhytm)
                    .padding(.horizontal, 10)
                
                BiorhythmsLegendView(biorhythms: rhythmBuilder.biorhytms)
                
                ForEach(rhythmBuilder.biorhytms, id: \.type) { biorhythm in
                    Text("\(biorhythm.returnPercent())")
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
