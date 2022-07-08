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
    //var amplitude: Double = 70
    let distanceInDays = 24
    var type: Biorythms = .physical
    
    // some func to calculate dates
    let daysFromBirthDate = 13459
    let startDate = 13459 - 12
    let endDate = 13459 + 12
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let width = Double(rect.width)
        let height = Double(rect.height)
        
        // Draw x-axis
        path.move(to: CGPoint(x: 0, y: height / 2))
        path.addLine(to: CGPoint(x: width, y: height / 2))
        
        // Draw rhythm
        let startPointY = sin(2 * Double.pi * Double((daysFromBirthDate - distanceInDays)/2) / type.rawValue)
        let normalizedStartY = -height / 2 * startPointY + height / 2
        
        path.move(to: CGPoint(x: 0, y: normalizedStartY))
        
        

        return Path(path.cgPath)
    }
    
    
}
