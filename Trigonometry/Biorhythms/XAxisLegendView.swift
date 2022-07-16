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
        let startDay = self.biorhythm.firstDay
        let endDay = self.biorhythm.firstDay + Double(self.biorhythm.distance)
        
        for day in stride(from: startDay, to: endDay, by: 7.0) {
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
