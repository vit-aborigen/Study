//
//  ContentView.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 2.08.22.
//  based on https://www.youtube.com/watch?v=b8sP7AS0CAY&ab_channel=DesignCode
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.custom("SF Pro", size: 70))

            Text("Hello, world!")
                .font(<#T##font: Font?##Font?#>)
                .fontWeight(.thin)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
