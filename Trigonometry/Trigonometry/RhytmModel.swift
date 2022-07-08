//
//  RhytmModel.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 8.07.22.
//

import Foundation
import SwiftUI

enum Biorythms: Double {
    case physical = 23.68
    case emotional = 28.43
    case intellectual = 33.16
}

struct Rhytm: Shape {
    let distanceInDays = 30
    var type: Biorythms = .physical
    
    // some func to calculate dates
    let daysFromBirthDate = 13460
    let startDate = 13445
    let endDate = 13475
    
    func path(in rect: CGRect) -> Path {
        let normilizedY = { (mathY: Double) -> (Double) in
            -rect.height / 2 * mathY + rect.height / 2
        }
        
        let normilizedX = { (mathX: Double) -> (Double) in
            (mathX - Double(startDate)) / Double(distanceInDays) * rect.width
        }
        
        let path = UIBezierPath()
        
        let startPointY = sin(2 * Double.pi * Double((startDate)) / type.rawValue)
        let normalizedStartY = normilizedY(startPointY)
        
        path.move(to: CGPoint(x: 0, y: normalizedStartY))
        for day in stride(from: Double(startDate), to: Double(endDate), by: 0.1) {
            let mathY = sin(2 * Double.pi * Double(day) / type.rawValue)
            let x = normilizedX(day)
            let y = normilizedY(mathY)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return Path(path.cgPath)
    }
}

struct Axis: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let width = Double(rect.width)
        let height = Double(rect.height)
        
        // Draw x-axis
        path.move(to: CGPoint(x: 0, y: height / 2))
        path.addLine(to: CGPoint(x: width, y: height / 2))
        
        // Draw y-today
        path.move(to: CGPoint(x: width / 2, y: 0))
        path.addLine(to: CGPoint(x: width / 2, y: height))
        
        return Path(path.cgPath)
    }
}
