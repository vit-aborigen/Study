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
    let distanceInDays: Int
    var type: Biorythms
    let padding = 0.0 // 2DO: it would be nice to implement some padding so we can have some additional space for other stuff on edges
    
    // 2DO: some func to calculate dates
    let daysFromBirthDate = DateHelper().daysFromBirthDay
    var startDate: Int { daysFromBirthDate - distanceInDays / 2 }
    var endDate: Int { daysFromBirthDate + distanceInDays / 2 }
    
    func path(in rect: CGRect) -> Path {
        let canvasWidth = rect.width * (1 - padding)
        let canvasHeight = rect.height * (1 - padding)
        
        let normalizedY = { (mathY: Double) -> (Double) in
            -rect.height / 2 * mathY + canvasHeight / 2
        }
        
        let normalizedX = { (mathX: Double) -> (Double) in
            (mathX - Double(startDate)) / Double(distanceInDays) * canvasWidth
        }
        
        let path = UIBezierPath()
        
        let startPointY = sin(2 * Double.pi * Double((startDate)) / type.rawValue)
        let normalizedStartY = normalizedY(startPointY)
        
        path.move(to: CGPoint(x: 0, y: normalizedStartY))
        for day in stride(from: Double(startDate), to: Double(endDate), by: 0.1) {
            let mathY = sin(2 * Double.pi * Double(day) / type.rawValue)
            let x = normalizedX(day)
            let y = normalizedY(mathY)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        return Path(path.cgPath)
    }
}
