//
//  ContentView.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var field = Field(rows: 2, columns: 2, bombs: 2)
    
    var body: some View {
        VStack {
            // Status bar
            
            FieldView(board: field)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
