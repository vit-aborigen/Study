//
//  AxisView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 9.07.22.
//

import SwiftUI

struct AxisView: View {
    var values = [1, 2, 3, 4, 5, 6]
    
    var body: some View {
        ZStack {
            Axis()
                .stroke(.black, lineWidth: 1)
                .opacity(0.5)
        }
    }
}

struct AxisView_Previews: PreviewProvider {
    static var previews: some View {
        AxisView()
    }
}
