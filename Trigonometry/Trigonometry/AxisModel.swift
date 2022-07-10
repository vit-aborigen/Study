//
//  AxisModel.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 9.07.22.
//

import Foundation
import SwiftUI

struct Axis: Shape {
    // 2DO: pass dates later
    let dates = 1...4
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let width = rect.width
        let height = rect.height
        let delimeterHeight = height / 50
        let xValuesOffset = width / Double(dates.count)
        
        // Draw x-axis
        path.move(to: CGPoint(x: 0, y: height / 2))
        path.addLine(to: CGPoint(x: width, y: height / 2))
        
        // Draw delimeters
        for x in stride(from: 0, to: width, by: xValuesOffset) {
            path.move(to: CGPoint(x: x, y: height / 2 - delimeterHeight / 2))
            path.addLine(to: CGPoint(x: x, y: height / 2 + delimeterHeight / 2))
        }
        
        // Draw 100% lines
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        
        path.move(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        
        // 2do: Draw y-today (odd / even logic hasn't implemented yet
        path.move(to: CGPoint(x: width / 2, y: 0))
        path.addLine(to: CGPoint(x: width / 2, y: height))
        
        return Path(path.cgPath)
    }
}
