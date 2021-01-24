//
//  Theme.swift
//  CS193p (iOS)
//
//  Created by Minh Dang on 1/24/21.
//

import Foundation
import SwiftUI

struct EmojiStore {
    var theme: GameTheme
    var color: Color
    var emojiSets: Set<String>
    
    init(of theme: GameTheme, with pairs: Int) {
        self.theme = theme
        switch theme {
        case .halloween:
            emojiSets = ["👽", "👻", "🕷", "🎃", "🤡"]
            color = Color.orange
        case .animal:
            emojiSets = ["🦁", "🐶", "🐭", "🐱", "🐻"]
            color = Color.green
        case .mixed:
            emojiSets = ["👺", "💩", "💅", "🧑‍🦽", "🧶"]
            color = Color.yellow
        }
    }
}

enum GameTheme: Int, CaseIterable {
    case halloween
    case animal
    case mixed
}

