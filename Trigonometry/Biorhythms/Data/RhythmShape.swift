//
//  RhytmBuilder.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import Foundation
import SwiftUI

struct Rhythm: Shape {
    var biorhytm: Biorhythm
    
    var animatableData: Double {
        get { biorhytm.firstDay }
        set { biorhytm.firstDay = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let canvasWidth = rect.width
        let canvasHeight = rect.height
        
        let normalizedY = { (mathY: Double) -> (Double) in
            -canvasHeight / 2 * mathY + canvasHeight / 2
        }
        
        let normalizedOverallY = { (mathY: Double) -> (Double) in
            -rect.height / 2 * mathY / 3 + canvasHeight / 2
        }
        
        let normalizedX = { (mathX: Double) -> (Double) in
            (mathX - biorhytm.firstDay) / Double(biorhytm.distance) * canvasWidth
        }
        
        let path = UIBezierPath()
        let startPointY = biorhytm.getStateForDay(dayFromBirth: biorhytm.firstDay)
        let normalizedStartY = biorhytm.type == .overall ? normalizedOverallY(startPointY) : normalizedY(startPointY)
        
        path.move(to: CGPoint(x: 0, y: normalizedStartY))
        
        for day in stride(from: biorhytm.firstDay, to: biorhytm.firstDay + Double(biorhytm.distance), by: 0.1) {
            let mathY = biorhytm.getStateForDay(dayFromBirth: day)
            let x = normalizedX(day)
            let y = biorhytm.type == .overall ? normalizedOverallY(mathY) : normalizedY(mathY)
            if day == biorhytm.firstDay + 3 {                                                      // Add dot for TODAY
                path.addArc(withCenter: CGPoint(x: x, y: y), radius: 2, startAngle: 0, endAngle: 360, clockwise: true)
            }
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return Path(path.cgPath)
    }
}
