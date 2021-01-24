//
//  MemoryGame.swift
//  CS193p
//
//  Created by Minh Dang on 1/23/21.
//

import Foundation
struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var score: Int = 0
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter{cards[$0].isFaceUp}.only
        }
        set {
            for index in 0..<cards.count {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        // Shuffle cards
        cards.shuffle()
    }
    
    mutating func choose(card: Card) -> Void {
        // If the card is not matched and facing up
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isMatched, !cards[chosenIndex].isFaceUp {
            // If there is one card facing up
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // Compare content of the two facing up cards
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].isUp {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].isUp {
                        score -= 1
                    }
                }
                
                cards[chosenIndex].isUp = true
                cards[potentialMatchIndex].isUp = true
                cards[chosenIndex].isFaceUp = true

            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            print("card chosen: \(cards[chosenIndex])")
        }
    }

    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isUp: Bool = false
        var content: CardContent
        var id: Int
    }
}

