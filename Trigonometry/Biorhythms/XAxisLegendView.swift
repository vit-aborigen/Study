//
//  XAxisLegendView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 13.07.22.
//

import SwiftUI

struct XAxisLegendView: View {
    @Binding var biorhythm: Biorhythm
    @State var textSize = CGSize.zero
    var values = Array<String> ()
    
    init(biorhythm: Binding<Biorhythm>) {
        self._biorhythm = biorhythm
        let distance = Double(self.biorhythm.distance)
        let startDay = self.biorhythm.firstDay
        let endDay = self.biorhythm.firstDay + distance
        let frequency = 7.0 // 1 week
        
        for day in stride(from: startDay, to: endDay, by: frequency >= distance ? distance - 1 : frequency)  {
            self.values.append(DateHelper.getAxisNamesForDay(for: day))
        }
    }
    
    var body: some View {
        HStack(alignment: .bottom ,spacing: 0) {
            ForEach(values, id: \.self) { value in
                Text("\(value)")
                    .font(.caption).fixedSize()
                    .clipped()
                
                if value != values.last {
                    Spacer()
                }
            }
        }
    }
}

struct XAxisLegendView_Previews: PreviewProvider {
    static var previews: some View {
        XAxisLegendView(biorhythm: .constant(Biorhythm(type: .physical, name: "Physical")))
    }
}
