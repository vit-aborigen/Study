//
//  XAxisLegendView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 13.07.22.
//

import SwiftUI

struct XAxisLegendView: View {
    @Binding var biorhythm: Biorhythm
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(biorhythm.firstDay)")
        }
    }
}

struct XAxisLegendView_Previews: PreviewProvider {
    static var previews: some View {
        XAxisLegendView(biorhythm: .constant(Biorhythm(type: .physical, name: "Physical")))
    }
}
