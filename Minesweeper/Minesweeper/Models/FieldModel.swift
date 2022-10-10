//
//  FieldModel.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

class Field: ObservableObject {
    private(set) var rows: Int
    private(set) var columns: Int
    private(set) var bombsCount: Int
    
    @Published private(set) var field: [[Cell]]
    private(set) var cellDict: [Cell: Int] = [:]
    
    init(rows: Int = 16, columns: Int = 30, bombs: Int = 99) {
        self.rows = rows
        self.columns = columns
        self.bombsCount = bombs
        self.field = []

        generateField()
    }
    
    private func generateBombs() -> [(Int, Int)] {
        var bombCoords: [(Int, Int)] = []
        let allPossibleCells = (0...rows * columns - 1).shuffled()
        for i in allPossibleCells[0...bombsCount - 1] {
            let x = i / columns
            bombCoords.append((x, i % columns))
        }
        
        return bombCoords
    }
    
    private func generateField() {
        self.field = (0..<rows).map{ _ in (0..<columns).map { _ in Cell(hasBomb: false) }}
        print(field)
        
        let bombs = generateBombs()
        
        for bomb in bombs {
            field[bomb.0][bomb.1].putBomb()
        }

        for x in 0 ..< rows {
            for y in 0 ..< columns {
                if !field[x][y].hasBomb {
                    cellDict[field[x][y]] = checkNeighbours(cell: (x, y))
                }
            }
        }
    }
    
    private func checkNeighbours(cell: (Int, Int)) -> Int {
        var counter = 0
        
        let startX = cell.0 - 1 >= 0 ? cell.0 - 1 : 0
        let endX = cell.0 + 1 < rows ? cell.0 + 1 : rows - 1
        let startY = cell.1 - 1 >= 0 ? cell.1 - 1 : 0
        let endY = cell.1 + 1 < columns ? cell.1 + 1 : columns - 1
        
        for x in startX...endX {
            for y in startY...endY {
                if x != cell.0 && y != cell.1 && field[x][y].hasBomb {
                    counter += 1
                }
            }
        }
        
        return counter
    }
}
