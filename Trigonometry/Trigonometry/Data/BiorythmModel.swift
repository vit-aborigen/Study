//
//  BiorythmModel.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import Foundation

struct Biorhythm {
    var type: BiorhythmType
    var distance: Int = 33 // According to the HoR-24 33 days is a fixed value
    var currentState = 0.0
    let name: String
    
    init(type: BiorhythmType, name: String) {
        self.type = type
        self.name = name
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
    
    func getStateInPercent() -> Int {
        type == .overall
        ? Int(currentState / 3 * 100)
        : Int(currentState * 100)
    }
}

enum BiorhythmType: Double, CaseIterable {
    case physical = 23.68
    case emotional = 28.43
    case intellectual = 33.16
    case overall = 0
}
