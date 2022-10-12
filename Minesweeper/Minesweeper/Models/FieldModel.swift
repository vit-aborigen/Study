//
//  FieldModel.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

enum GameStatus {
    case win, lose, inProgress
    
    var isGameEnded: Bool {
        return self != .inProgress
    }
}

class Field: ObservableObject {
    let rows: Int
    let columns: Int
    let bombsCount: Int
    @Published var flagsLeft: Int
    @Published var gameStatus: GameStatus = .inProgress
    private var amountOfOpenedCells = 0
    
    @Published private(set) var field: [[Cell]]
    private(set) var cellDict: [Cell: Int] = [:]
    
    init(rows: Int = 16, columns: Int = 30, bombs: Int = 99) {
        self.rows = rows
        self.columns = columns
        self.bombsCount = bombs
        self.field = []
        self.flagsLeft = bombsCount

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
        field = (0 ..< rows).map { _ in (0 ..< columns).map { _ in Cell(hasBomb: false) }}

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
    
    func getNeighbours(cell: (Int, Int)) -> [(Int, Int)] {
        var neighbours: [(Int, Int)] = []
        
        let startX = cell.0 - 1 >= 0 ? cell.0 - 1 : 0
        let endX = cell.0 + 1 < rows ? cell.0 + 1 : rows - 1
        let startY = cell.1 - 1 >= 0 ? cell.1 - 1 : 0
        let endY = cell.1 + 1 < columns ? cell.1 + 1 : columns - 1
        
        for x in startX...endX {
            for y in startY...endY {
                neighbours.append((x, y))
            }
        }
        
        return neighbours
    }
    
    private func checkNeighbours(cell: (Int, Int)) -> Int {
        var counter = 0
        let neighbours = getNeighbours(cell: cell)
        for neighbour in neighbours {
            if field[neighbour.0][neighbour.1].hasBomb {
                counter += 1
            }
        }
        
        return counter
    }
    
    func openEmptyBlock(cell: (Int, Int)) {
        var cellsToCheck = [cell]
        
        while !cellsToCheck.isEmpty {
            let currentPosition = cellsToCheck.popLast()!
            let currentCell = field[currentPosition.0][currentPosition.1]
            
            if !currentCell.isOpened, !currentCell.isFlagged {
                currentCell.open()
                amountOfOpenedCells += 1
                
                if cellDict[currentCell] == 0 {
                    cellsToCheck.append(contentsOf: getNeighbours(cell: currentPosition))
                }
            }
        }
    }
    
    func openCell(cellCoords: (Int, Int)) {
        let cell = field[cellCoords.0][cellCoords.1]
        
        if cell.hasBomb {
            gameStatus = .lose
            cell.wrongUserChoise = true
            for cell in field.flatMap({ $0 }).filter({ $0.hasBomb }) {
                cell.open()
            }
        }
        
        let bombCounter = cellDict[cell]
        if bombCounter == 0 {
            openEmptyBlock(cell: cellCoords)
        } else {
            cell.open()
            amountOfOpenedCells += 1
            
            if amountOfOpenedCells == cellDict.count {
                gameStatus = .win
            }
        }
        
        if amountOfOpenedCells == cellDict.count {
            gameStatus = .win
        }
    }
    
    func toggleFlag(cell: (Int, Int)) {
        let cell = field[cell.0][cell.1]
        flagsLeft += cell.isFlagged ? 1 : -1
        cell.toggleFlag()
    }
    
    func restart() {
        cellDict = [:]
        flagsLeft = bombsCount
        gameStatus = .inProgress
        amountOfOpenedCells = 0
        generateField()
    }
}
