//
//  Theme.swift
//  CS193p (iOS)
//
//  Created by Minh Dang on 1/24/21.
//

import SwiftUI

struct GameTheme {
    private(set) var name: String
    private(set) var emojis: [String]
    private(set) var color: Color
    
    static let halloween = GameTheme(name: "halloween", emojis: ["👽", "👻", "🕷", "🎃", "🤡"], color: Color.orange)
    static let animal = GameTheme(name: "animal", emojis: ["🦁", "🐶", "🐭", "🐱", "🐻", "🐨", "🐮", "🐷", "🐯", "🐼", "🦊"], color: Color.green)
    static let technology = GameTheme(name: "technology", emojis: ["🤖", "👾", "🦾", "🦿", "🎮", "🖲"], color: Color.black)
    static let flower = GameTheme(name: "flower", emojis: ["🌷", "🌺", "🌹", "🌸", "🌼", "🌻", "💐"], color: Color.pink)
    static let zodiac = GameTheme(name: "zodiac", emojis: ["♌️", "♍️", "♏️", "♓️", "♉️", "♈️", "⛎", "♒️", "♋️", "⛎", "♊️", "♑️"], color: Color.purple)
    static let random = GameTheme(name: "halloween", emojis: ["👺", "💩", "💅", "🧑‍🦽", "🧶"], color: Color.yellow)
    static let themes: [GameTheme] = [halloween, animal, random, technology, flower, zodiac]
}



