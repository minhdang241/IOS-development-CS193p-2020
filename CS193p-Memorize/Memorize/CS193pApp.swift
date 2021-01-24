//
//  CS193pApp.swift
//  Shared
//
//  Created by Minh Dang on 1/22/21.
//

import SwiftUI

@main
struct CS193pApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
