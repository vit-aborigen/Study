//
//  XAxisLegendView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 13.07.22.
//

import SwiftUI

struct XAxisLegendView: View {
    let frameWidth: Double
    let data: [Int]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(data, id: \.self) { item in
                Text("\(item)")
                    .font(.footnote)
            }
        }
    }
}

struct XAxisLegendView_Previews: PreviewProvider {
    static var previews: some View {
        XAxisLegendView(frameWidth: 400, data: [23, 34, 23, 23, 23, 12])
    }
}
