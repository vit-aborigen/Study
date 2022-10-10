//
//  CellView.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

struct CellView: View {
    var cell: Cell
    var bombsAround: Int?
    
    var image: Image {
        if cell.isFlagged {
            return Image("flag")
        }
        if !cell.isOpened {
            return Image("normal")
        }
        return Image("normal")
    }
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell(hasBomb: true))
    }
}
