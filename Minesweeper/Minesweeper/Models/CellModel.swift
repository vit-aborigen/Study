//
//  CellModel.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

class Cell: Identifiable, ObservableObject {
    let id = UUID()
    @Published private(set) var isOpened: Bool
    private(set) var hasBomb: Bool
    @Published private(set) var isFlagged: Bool
    
    init(hasBomb: Bool) {
        self.isOpened = false
        self.hasBomb = hasBomb
        self.isFlagged = false
    }
    
    func open() -> Bool {
        if !isFlagged && !isOpened {
            isOpened = true
        }
        
        return hasBomb
    }
    
    func toggleFlag() {
        if !isOpened {
            isFlagged.toggle()
        }
    }
    
    func putBomb() {
        hasBomb = true
    }
}
