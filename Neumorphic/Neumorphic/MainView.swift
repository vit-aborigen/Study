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
        VStack {
            ZStack {
                Color.neumorph

                VStack {
                    Text("Light theme")
                        .font(.caption2.bold())
                        .foregroundColor(.gray)
                    
                    Spacer()

                    Button {} label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray)
                    }
                    .buttonStyle(NeumorphicLightButtonStyle(shape: RoundedRectangle(cornerRadius: 10)))
                    
                    Spacer()
                }
            }

            ZStack {
                LinearGradient(.darkStart, .darkEnd)

                VStack {
                    Text("Dark theme")
                        .font(.caption2.bold())
                        .foregroundColor(.secondary)
                    
                    Button {} label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray)
                    }
                    .buttonStyle(NeumorphicDarkButtonStyle(shape: RoundedRectangle(cornerRadius: 10)))
                    
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
