//
//  ContentView.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 8.07.22.
//

import SwiftUI

struct ContentView: View {
    let dateInterval = 14
    
    var body: some View {
        ZStack {
            Axis()
                .stroke(.black, lineWidth: 3)
            
            Rhytm(type: .physical)
                .stroke(.red, lineWidth: 5)
            
            Rhytm(type: .emotional)
                .stroke(.blue, lineWidth: 5)
            
            Rhytm(type: .intellectual)
                .stroke(.green, lineWidth: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
