//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 04/11/24.
//

import SwiftUI

// this ViewModel is the gatekeeper between Model and the View

class EmojiMemorizeGame: ObservableObject {
    typealias Card = MemorizeGame<String>.Card
    
    // full separation
    // only this class can access
    
    private static let emojis = ["👾", "💀", "🤖", "🎃", "👽", "🐙", "🕸️", "⚡️", "☃️", "🦉", "🐞", "🍄"]    
    // or it can be written this way :
    // let emojis: [String] = ["👾", "💀", "🤖", "🎃"]
    // let emojis: Array<String> = ["👾", "💀", "🤖", "🎃"]
    
    private static func createMemorizeGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "😱"
            }
        }
    }
    
    @Published private var model = createMemorizeGame()
    
    // how the View get the cards?
    // ViewModel should provide the cards like the code below
    // this is to protecting the Model from being accessed directly from the View (has to go through the ViewModel)
    var cards: Array<Card> {
        return model.cards
    }
    
    var color: Color {
        .orange
    }
    
    // MARK: - Intents
    func shuffle() {
        model.shuffle()
    }
    
    // intent function
    // _ is used as a placeholder that ignores a parameter label or a value
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
