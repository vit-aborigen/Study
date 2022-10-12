//
//  ContentView.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

struct MainView: View {
    @StateObject var field = Field(rows: 5, columns: 5, bombs: 3)
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerText = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Bombs left: \(field.flagsLeft)")
                
                Spacer()
                
                Button {
                    field.restart()
                    timerText = 0
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                } label: {
                    Text("Restart")
                        .font(.title)
                }
                
                Spacer()
                
                Text("\(timerText)")
                    .onReceive(timer) { _ in
                        timerText += 1
                    }
                    .onChange(of: field.gameIsOver, perform: { _ in
                        if field.gameIsOver {
                            timer.upstream.connect().cancel()
                        }
                    })
                    .font(.title)
                    .frame(minWidth: UIScreen.main.bounds.size.width / 5)
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
