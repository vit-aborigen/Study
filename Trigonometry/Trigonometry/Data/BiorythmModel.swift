//
//  BiorythmModel.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import Foundation

struct Biorhythm {
    var type: BiorhythmType
    var currentState = -1.0
    
    
    init(type: BiorhythmType) {
        self.type = type
        let daysFromBirthDate = DateHelper().daysFromBirthDay
        currentState = getStateForDay(dayFromBirth: Double(daysFromBirthDate))
    }
    
    func getStateForDay(dayFromBirth: Double) -> Double {
        type == .overall
        ? sin(2 * Double.pi * Double(dayFromBirth) / BiorhythmType.intellectual.rawValue) +
        sin(2 * Double.pi * Double(dayFromBirth) / BiorhythmType.physical.rawValue) +
        sin(2 * Double.pi * Double(dayFromBirth) / BiorhythmType.emotional.rawValue)
        : sin(2 * Double.pi * Double((dayFromBirth)) / type.rawValue)
    }
    
    func returnPercent() -> String {
        String(format: "%.2f", self.currentState * 100)
    }
}

enum BiorhythmType: Double, CaseIterable {
    case physical = 23.68
    case emotional = 28.43
    case intellectual = 33.16
    case overall = 0
}
