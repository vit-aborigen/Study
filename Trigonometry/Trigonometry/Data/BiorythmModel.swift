//
//  BiorythmModel.swift
//  Trigonometry
//
//  Created by VITALI KAZLOU on 11.07.22.
//

import Foundation

class Biorhythm: ObservableObject {
    var type: BiorhythmType
    @Published var currentState: Double = -1.0
    
    init(type: BiorhythmType) {
        self.type = type
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
