//
//  BiorythmModel.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import Foundation

class Biorhythm: ObservableObject {
    var type: BiorhythmType
    var currentState = -1
    
    init(type: BiorhythmType) {
        self.type = type
    }
}

enum BiorhythmType: Double, CaseIterable {
    case physical = 23.68
    case emotional = 28.43
    case intellectual = 33.16
}
