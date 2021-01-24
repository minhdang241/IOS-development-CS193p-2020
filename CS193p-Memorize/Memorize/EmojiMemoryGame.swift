//
//  EmojiMemoryGame.swift
//  CS193p
//
//  Created by Minh Dang on 1/23/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published var model: MemoryGame<String>
    var theme: GameTheme

    init() {
        self.theme = GameTheme.themes.randomElement()!
        self.model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    static func createMemoryGame(with theme: GameTheme) -> MemoryGame<String> {
        let numberOfPairsOfCard = Int.random(in: 2...5)
        let emojis = theme.emojis
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCard) { pairIndex in emojis[pairIndex % emojis.count]}
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
        
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}



