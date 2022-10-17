//
//  ColorsExtension.swift
//  Neumorphic
//
//  Created by VITALI KAZLOU on 9.10.22.
//

import SwiftUI

extension Color {
    static let darkShadow = Color.white.opacity(0.7)
    static let lightShadow = Color.black.opacity(0.2)
    static let neumorph = Color(red: 1, green: 1, blue: 0.9)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
