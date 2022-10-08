//
//  CustomBlur.swift
//  WeatherAPP
//
//  Created by VITALI KAZLOU on 5.08.22.
//

import SwiftUI

class UIBackdropView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

struct Backdrop: UIViewRepresentable {
    func makeUIView(context: Context) -> UIBackdropView {
        UIBackdropView()
    }

    func updateUIView(_ uiView: UIBackdropView, context: Context) {}
}

struct CustomBlur: View {
    var radius: CGFloat = 3
    var opaque = false

    var body: some View {
        Backdrop()
            .blur(radius: radius, opaque: opaque)
    }
}

struct CustomBlur_Previews: PreviewProvider {
    static var previews: some View {
        CustomBlur()
    }
}
