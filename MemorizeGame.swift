//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 04/11/24.
//

import Foundation

struct MemorizeGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    // function as a type
    // cardContentFacrtory: () -> CardContent
    init(numberOfPairsOfCards: Int, cardContentFacrtory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFacrtory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    // data structure
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id  == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    indexOfTheOneAndOnlyFaceUpCard = nil
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    // nested card, this is allowed and good for namespacing
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible  {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
        var id: String
        
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}
