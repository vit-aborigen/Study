//
//  BiorythmModel.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import Foundation

struct Biorhythm {
    let type: BiorhythmType
    let distance: Int = 33 // According to the HoR-24 33 days is a fixed value
    var firstDay: Double {
        didSet {
            currentState = getStateForDay(dayFromBirth: firstDay + 3)
        }
    }
    
    var currentState = 0.0
    let name: String
    
    init(type: BiorhythmType, name: String, firstDay: Double = DateHelper().daysFromBirthDay - 3) {
        self.type = type
        self.name = name
        self.firstDay = firstDay
        currentState = getStateForDay(dayFromBirth: firstDay + 3)
    }
    
    func getStateForDay(dayFromBirth: Double) -> Double {
        type == .overall
        ? sin(2 * Double.pi * dayFromBirth / BiorhythmType.intellectual.rawValue) +
        sin(2 * Double.pi * dayFromBirth / BiorhythmType.physical.rawValue) +
        sin(2 * Double.pi * dayFromBirth / BiorhythmType.emotional.rawValue)
        : sin(2 * Double.pi * dayFromBirth / type.rawValue)
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
