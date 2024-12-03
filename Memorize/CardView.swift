//
//  CardView.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 13/11/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemorizeGame<String>.Card
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay (
                // MARK: Emojis
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            // use a custom ViewModifier : see lecture 7
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

private struct Constants {
    static let inset: CGFloat = 5
    
    struct FontSize {
        static let largest: CGFloat = 200
        static let smallest: CGFloat = 10
        static let scaleFactor: CGFloat = smallest / largest
    }
    
    struct Pie {
        static let opacity: CGFloat = 0.3
        static let inset: CGFloat = 5
    }
}

struct CardView_Previews: PreviewProvider {
    typealias Card = MemorizeGame<String>.Card
    
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(content: "X", id: "test1"))
                CardView(Card(isFaceUp: true, content: "X", id: "test1"))
            }
            HStack {
                CardView(Card(content: "X", id: "test1"))
                CardView(Card(isFaceUp: true, isMatched: true, content: "loooooong texttttttttttttttttttttttttttt ajdjabdjabd", id: "test1"))
            }
        }
            .padding()
            .foregroundStyle(.green)
    }
}
