//
//  CellView.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

struct CellView: View {
    @ObservedObject var cell: Cell
    var bombsAround: Int?

    var image: Image {
        if cell.isFlagged {
            return Image("flag")
        }

        if cell.isOpened {
            if cell.hasBomb {
                return Image("bomb")
            }
            if bombsAround == nil || bombsAround == 0 {
                return Image("empty")
            }

            return Image("\(bombsAround!)")
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
