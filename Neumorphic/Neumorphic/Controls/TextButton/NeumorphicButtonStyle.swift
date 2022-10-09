//
//  NeumorphicButtonStyle.swift
//  Neumorphic
//
//  Created by VITALI KAZLOU on 9.10.22.
//

import SwiftUI

struct NeumorphicButtonStyle: ButtonStyle {
    let shape: AnyShape

    init(shape: AnyShape) {
        self.shape = shape
    }

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(ShadowModel.bottom.radius * 3)
            .background(
                shape
                    .fill(Color.neumorph)
                    .shadow(color: ShadowModel.bottom.color, radius: ShadowModel.bottom.radius, x: ShadowModel.bottom.x, y: ShadowModel.bottom.y)
                    .shadow(color: ShadowModel.top.color, radius: ShadowModel.top.radius, x: ShadowModel.top.x, y: ShadowModel.top.y)
            )
    }
}
