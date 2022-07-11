//
//  RhytmBuilder.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import Foundation
import SwiftUI

class GraphBuilder: ObservableObject {
    var biorhytms: [Biorhythm] = Array<Biorhythm> ()
    
    init() {
        for bioType in BiorhythmType.allCases {
            biorhytms.append(Biorhythm(type: bioType))
        }
    }
    
    struct Rhythm: Shape {
        let distanceInDays = 330 // According to the HoR-24 33 days is a fixed value
        @ObservedObject var biorhytm: Biorhythm
        
        let daysFromBirthDate = DateHelper().daysFromBirthDay
        var startDate: Int { daysFromBirthDate - 3 } // Sergei's requirement. Retrospective must include 3 days only
        var endDate: Int { daysFromBirthDate + distanceInDays - 3 }
        
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
                (mathX - Double(startDate)) / Double(distanceInDays) * canvasWidth
            }
            
            let path = UIBezierPath()
            var startPointY = 0.0
            
            if biorhytm.type == .overall {
                startPointY = sin(2 * Double.pi * Double(startDate) / BiorhythmType.intellectual.rawValue) +
                              sin(2 * Double.pi * Double(startDate) / BiorhythmType.physical.rawValue) +
                              sin(2 * Double.pi * Double(startDate) / BiorhythmType.emotional.rawValue)
            } else {
                startPointY = sin(2 * Double.pi * Double((startDate)) / biorhytm.type.rawValue)
            }
            let normalizedStartY = biorhytm.type == .overall ? normalizedOverallY(startPointY) : normalizedY(startPointY)
            
            path.move(to: CGPoint(x: 0, y: normalizedStartY))
            
            for day in stride(from: Double(startDate), to: Double(endDate), by: 0.1) {
                var mathY = 0.0
                if biorhytm.type == .overall {
                    mathY = sin(2 * Double.pi * Double(day) / BiorhythmType.intellectual.rawValue) +
                            sin(2 * Double.pi * Double(day) / BiorhythmType.physical.rawValue) +
                            sin(2 * Double.pi * Double(day) / BiorhythmType.emotional.rawValue)
                } else {
                    mathY = sin(2 * Double.pi * Double(day) / biorhytm.type.rawValue)
                }
                
                if day == Double(daysFromBirthDate) {   // nothing to worry about - Swift compares doubles with pow(10) precision
                    print("1", biorhytm.type, biorhytm.currentState, mathY)
                    biorhytm.currentState = mathY
                    print("2", biorhytm.type, biorhytm.currentState, mathY)
                }
                
                let x = normalizedX(day)
                let y = biorhytm.type == .overall ? normalizedOverallY(mathY) : normalizedY(mathY)
                path.addLine(to: CGPoint(x: x, y: y))
            }
            return Path(path.cgPath)
        }
    }
    
    
    func drawRhythm(type: Biorhythm) -> Rhythm {
        return Rhythm(biorhytm: type)
    }
}
