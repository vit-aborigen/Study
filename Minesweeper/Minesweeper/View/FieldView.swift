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
        var gridItem = Array(repeating: GridItem.init(spacing: 0), count: board.columns)
        
        LazyVGrid(columns: gridItem, spacing: 0) {
            ForEach(0..<board.rows) { row in
                ForEach(0..<board.columns) { column in
                    CellView()
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
