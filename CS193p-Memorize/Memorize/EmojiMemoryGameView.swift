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
                Text("Score: \(viewModel.getScore())")
            }
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75)) {
                        viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(theme.color)
            
            Button(action: {
                withAnimation(.easeInOut(duration: 2)) {
                    viewModel.reset()
                }
            }) {
                Text("New Game")
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    @State private var animatedBonusTimeRemaining: Double = 0
    
    
    private func startBonusTimeAnimation() {
        animatedBonusTimeRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusTimeRemaining = 0
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack(content: {
                    Group {
                        if card.isConsumingBonusTime {
                            Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: -animatedBonusTimeRemaining*360 - 90),clockwise: true)
                                
                                .onAppear(perform: {
                                    startBonusTimeAnimation()
                                })
                        } else {
                            Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: -card.bonusRemaining*360 - 90),clockwise: true)
                        }
                    }
                    .padding(5)
                    .opacity(0.4)
                    
                    
                    Text(card.content)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height)*fontSizeFactor))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear.repeatForever(autoreverses: false) : .default)
                })
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
                
            }
        }
    }
    
    private let fontSizeFactor: CGFloat = 0.7
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
