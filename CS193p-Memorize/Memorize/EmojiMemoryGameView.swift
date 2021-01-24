//
//  EmojiMemoryGameView.swift
//  Shared
//
//  Created by Minh Dang on 1/22/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var theme: GameTheme {
        return viewModel.theme
    }
    var body: some View {
        VStack {
            HStack {
                Text("Theme: \(theme.name)")
                Text("Score: \(viewModel.model.score)")
            }
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(theme.color)
            
            Button(action: {
                let theme = GameTheme.themes.randomElement()!
                viewModel.model = EmojiMemoryGame.createMemoryGame(with: theme)
                viewModel.theme = theme
            }) {
                Text("New Game")
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(content: {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: lineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: 10.0).fill()
                    }
                }
            })
            .font(Font.system(size: min(geometry.size.width, geometry.size.height)*fontSizeFactor))
        }
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3
    let fontSizeFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
