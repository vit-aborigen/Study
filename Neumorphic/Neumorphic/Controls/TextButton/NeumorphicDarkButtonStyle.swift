//
//  NeumorphicDarkButtonStyle.swift
//  Neumorphic
//
//  Created by VITALI KAZLOU on 18.10.22.
//

import SwiftUI

struct NeumorphicDarkButtonStyle<T: Shape>: ButtonStyle {
    let shape: T
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(ShadowModel.bottom.radius * 3)
            .contentShape(shape)
            .background(DarkBackgroundView(isHighlighted: configuration.isPressed, shape: shape))
    }
}
