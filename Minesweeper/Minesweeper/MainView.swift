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
    @State private var cellSize: CGFloat = 30.0
    
    @State private var flagOffset = CGSize.zero
    @State private var boardAreaSize: CGFloat? = nil
    
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
                
                VStack {
                    Button {
                        board.restart()
                        timerText = 0
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    } label: {
                        Text(newGameButtonText)
                            .font(.title)
                    }
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
            
            GeometryReader { geo in
                ZStack(alignment: .top) {
                    Group {
                        Image("normal")
                            .resizable()
                            .scaledToFit()
                        
                        Image("flag")
                            .resizable()
                            .scaledToFit()
                            .offset(flagOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged { transition in
                                        flagOffset = transition.translation
                                    }
                                    .onEnded { transition in
                                        flagOffset = .zero
                                        
                                        let normalizedOffsetX = transition.translation.height / cellSize
                                        let normalizedOffsetY = transition.translation.width / cellSize
                                        
                                        var cellX = Int(normalizedOffsetX.rounded()) - 1
                                        var cellY = Int(Double(board.columns) / 2 + normalizedOffsetY)
                                        
                                        cellX = max(0, cellX)
                                        cellX = min(cellX, board.rows - 1)
                                        cellY = max(0, cellY)
                                        cellY = min(cellY, board.columns - 1)
                                        
                                        board.field[cellX][cellY].toggleFlag()
                                    }
                            )
                    }
                    .zIndex(1)
                    .frame(height: cellSize)
                
                    BoardView(board: board)
                        .frame(height: geo.size.height - cellSize, alignment: .top)
                        .offset(y: cellSize)
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .onAppear {
                                        cellSize = min(geo.size.width / Double(board.columns), geo.size.height / Double(board.rows))
                                    }
                            }
                        )
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
