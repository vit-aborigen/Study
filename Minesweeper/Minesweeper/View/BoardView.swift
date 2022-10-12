//
//  FieldView.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var board: Board

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<board.rows) { row in
                HStack(spacing: 0) {
                    ForEach(0..<board.columns) { column in
                        let cell = board.field[row][column]
                        CellView(cell: board.field[row][column], bombsAround: board.cellDict[cell])
                            .onTapGesture {
                                board.openCell(cellCoords: (row, column))
                            }
                            .onLongPressGesture {
                                board.toggleFlag(cell: (row, column))
                            }
                            .disabled(board.gameStatus.isGameEnded)
                            .overlay {
                                if cell.wrongUserChoise && board.gameStatus == .lose {
                                    Color.red.opacity(0.3)
                                }
                            }
                    }
                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(board: Board())
    }
}
