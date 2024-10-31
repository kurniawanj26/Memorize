//
//  ContentView.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis = ["👾", "💀", "🤖", "🎃", "👽"]
        // or it can be written this way :
        // let emojis: [String] = ["👾", "💀", "🤖", "🎃"]
        // let emojis: Array<String> = ["👾", "💀", "🤖", "🎃"]
        
        HStack {
            // ForEach is a struct that 'behaves' like a View
            // ForEach(0..<4, id: \.self) { index in
            // instead of using 0..<4 there is anothe way to get the indexes like below code
            // it's more dynamic
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(Color(.systemPink))
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let card: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                card.fill(Color(.white))
                card.stroke(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                card
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
