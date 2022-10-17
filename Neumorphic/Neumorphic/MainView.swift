//
//  ContentView.swift
//  Neumorphic
//
//  Created by VITALI KAZLOU on 14.07.22.
//
// https://www.raywenderlich.com/7589178-how-to-create-a-neumorphic-design-with-swiftui#ratings-count-hook

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.yellow
            
            Button {
                
            } label: {
                Image(systemName: "globe")
            }
            .buttonStyle(NeumorphicButtonStyle(shape: RoundedRectangle(cornerRadius: 10)))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
