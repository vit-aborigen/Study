//
//  ContentView.swift
//  Minesweeper
//
//  Created by VITALI KAZLOU on 10.10.22.
//

import SwiftUI

struct MainView: View {
    @StateObject var board = Board(rows: 30, columns: 16, bombs: 99)
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timerText = 0
    
    var newGameButtonText: String {
        switch board.gameStatus {
        case .win: return "😎"
        case .inProgress: return "🤡"
        case .lose: return "☠️"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Bombs left: \(board.flagsLeft)")
                
                Spacer()
                
                Button {
                    board.restart()
                    timerText = 0
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                } label: {
                    Text(newGameButtonText)
                        .font(.title)
                }
                
                Spacer()
                
                Text("\(timerText)")
                    .onReceive(timer) { _ in
                        timerText += 1
                    }
                    .onChange(of: board.gameStatus, perform: { _ in
                        if board.gameStatus.isGameEnded {
                            timer.upstream.connect().cancel()
                        }
                    })
                    .font(.title)
                    .frame(minWidth: UIScreen.main.bounds.size.width / 5)
            }
            
            BoardView(board: board)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
