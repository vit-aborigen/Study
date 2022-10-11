//
//  ContentView.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

struct MainView: View {
    @StateObject var field = Field(rows: 5, columns: 5, bombs: 3)
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Bombs left: \(field.flagsLeft)")
                
                Spacer()
                
                Button {
                    field.restart()
                } label: {
                    Text("Restart")
                        .font(.title)
                }
                
                Spacer()
                
                Text("I'm timer")
            }
            
            FieldView(board: field)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
