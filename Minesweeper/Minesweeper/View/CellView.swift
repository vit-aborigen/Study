//
//  CellView.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

struct CellView: View {
    var body: some View {
        Image("1")
            .resizable()
            .scaledToFill()
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
