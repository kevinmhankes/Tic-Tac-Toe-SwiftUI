//
//  GameView.swift
//  Shared
//
//  Created by Kevin Hankes on 2/5/22.
//

import SwiftUI

struct GameView: View {
    @StateObject private var gameViewModel = GameViewModel()
    

    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: gameViewModel.columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry)
                            PlayerIndicator(systemImageName: gameViewModel.moves[i]?.indicator ?? "")
                            
                        }
                        .onTapGesture {
                            gameViewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(gameViewModel.isGameboardDisabled)
            .padding()
            .alert(item: $gameViewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: { gameViewModel.resetGame() }))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
.previewInterfaceOrientation(.portrait)
    }
}

struct GameSquareView: View {
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.red).opacity(0.8)
            .frame(width: proxy.size.width/3 - 15,
                   height: proxy.size.height/3 - 15)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}
