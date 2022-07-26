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
        ? sin(2 * Double.pi * dayFromBirth / BiorhythmType.getPeriod(bio: .intellectual)) +
        sin(2 * Double.pi * dayFromBirth / BiorhythmType.getPeriod(bio: .physical)) +
        sin(2 * Double.pi * dayFromBirth / BiorhythmType.getPeriod(bio: .emotional))
        : sin(2 * Double.pi * dayFromBirth / BiorhythmType.getPeriod(bio: type))
    }
    
    func getStateInPercent() -> Int {
        type == .overall
        ? Int(currentState / 3 * 100)
        : Int(currentState * 100)
    }
}

enum BiorhythmType: Double {
    case physical, emotional, intellectual, overall
}

extension BiorhythmType {
    static func getPeriod(bio: BiorhythmType) -> Double {
        switch bio {
        case .physical:
            return 23.68
        case .emotional:
            return 28.43
        case .intellectual:
            return 33.16
        default:
            return 0
        }
    }
}
