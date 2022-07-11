//
//  AxisModel.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 9.07.22.
//

import Foundation
import SwiftUI

struct Axis: Shape {
    let delimetersAmount = 33
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let width = rect.width
        let height = rect.height
        let delimeterHeight = height / 42                                           // everything looks better when 42
        let xValuesOffset = width / Double(delimetersAmount)
        
        // Draw x-axis
        path.move(to: CGPoint(x: 0, y: height / 2))
        path.addLine(to: CGPoint(x: width, y: height / 2))
        
        // Draw delimeters
        for x in stride(from: 0, to: width, by: xValuesOffset) {
            if x == 3 * xValuesOffset {                                             // Today's line
                path.move(to: CGPoint(x: x, y: 0))
                path.addLine(to: CGPoint(x: x, y: height))
            }
            path.move(to: CGPoint(x: x, y: height / 2 - delimeterHeight / 2))
            path.addLine(to: CGPoint(x: x, y: height / 2 + delimeterHeight / 2))
        }
        
        // Draw 100% lines
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        
        path.move(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))

        
        return Path(path.cgPath)
    }
}
