//
//  FieldView.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

struct FieldView: View {
    @StateObject var board: Field
    
    var body: some View {
        let gridItem = Array(repeating: GridItem.init(spacing: 0), count: board.columns)
        
        LazyVGrid(columns: gridItem, spacing: 0) {
            ForEach(0..<board.rows) { row in
                ForEach(0..<board.columns) { column in
                    var cell = board.field[row][column]
                    CellView(cell: board.field[row][column], bombsAround: board.cellDict[cell])
                        .onTapGesture {
                            cell.open()
                        }
                }
            }
        }
    }
}

struct FieldView_Previews: PreviewProvider {
    static var previews: some View {
        FieldView(board: Field())
    }
}
