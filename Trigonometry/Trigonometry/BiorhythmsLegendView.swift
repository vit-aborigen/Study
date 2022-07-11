//
//  BiorythmsLegendView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import SwiftUI

struct BiorhythmsLegendView: View {
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .stroke(.purple, lineWidth: 3)
                
                Spacer()
                
                Circle()
                    .stroke(.red, lineWidth: 3)
            }
            
            Spacer()
            
            HStack {
                Circle()
                    .stroke(.green, lineWidth: 3)
                
                Spacer()
                
                Circle()
                    .stroke(.blue, lineWidth: 3)
            }
        }
    }
}

struct BiorhythmsLegendView_Previews: PreviewProvider {
    static var previews: some View {
        BiorhythmsLegendView()
    }
}
