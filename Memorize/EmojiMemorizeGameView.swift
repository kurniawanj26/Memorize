//
//  EmojiMemorizeGameView.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 29/10/24.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    @ObservedObject var viewModel: EmojiMemorizeGame
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundStyle(viewModel.color)
                .animation(.default, value: viewModel.cards)
        }
        Button("Shuffle") {
            viewModel.shuffle()
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)                
                .padding(spacing)
                .onTapGesture {
                    // it's like : hey ViewModel I have the intent to choose a card
                    viewModel.choose(card)
                } 
        }
    }
}

#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGame())
}
