//
//  ViewExtension.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 5.08.22.
//

import SwiftUI

extension View {
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        self
            .background(
                CustomBlur(radius: radius, opaque: opaque)
            )
    }
}
