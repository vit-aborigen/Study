//
//  Shadows.swift
//  Neumorphic
//
//  Created by VITALI KAZLOU on 9.10.22.
//

import SwiftUI

struct ShadowModel {
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    let color: Color
    
    static let top = ShadowModel(radius: 10, x: 10, y: 10, color: .lightShadow)
    static let bottom = ShadowModel(radius: 10, x: -5, y: -5, color: .darkShadow)
}
