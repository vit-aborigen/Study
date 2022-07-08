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
            Rhytm(type: .physical)
                .stroke(.red)
        }
    }
    
    func calculateData() -> [Date] {
        [Date()]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
