//
//  ContentView.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👾", "💀", "🤖", "🎃", "👽", "🐙", "🕸️", "⚡️", "☃️", "🦉", "🐞", "🍄"]
    // or it can be written this way :
    // let emojis: [String] = ["👾", "💀", "🤖", "🎃"]
    // let emojis: Array<String> = ["👾", "💀", "🤖", "🎃"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCounAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            // ForEach is a struct that 'behaves' like a View
            // ForEach(0..<4, id: \.self) { index in
            // instead of using 0..<4 there is anothe way to get the indexes like below code
            // it's more dynamic
            // ForEach(emojis.indices, id: \.self) { index in
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(Color(.systemPink))
    }
    
    var cardCounAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
                .imageScale(.large)
                .font(.largeTitle)
        })
        // modifier
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        // one liner function no need to write return
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let card: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            // MARK: Front
            Group {
                card.fill(Color(.white))
                card.stroke(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            // MARK: Back
            card.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
