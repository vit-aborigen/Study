//
//  NeumorphicButtonStyle.swift
//  Neumorphic
//
//  Created by VITALI KAZLOU on 9.10.22.
//

import SwiftUI

struct NeumorphicButtonStyle<T: Shape>: ButtonStyle {
    let shape: T

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(ShadowModel.bottom.radius * 3)
            .contentShape(shape)
            .background(
                Group {
                    if configuration.isPressed {
                        shape
                            .fill(Color.neumorph)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    } else {
                        shape
                            .fill(Color.neumorph)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}
