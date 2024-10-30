//
//  ContentView.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(Color(.systemPink))
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let card: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                card.fill(Color(.white))
                card.stroke(lineWidth: 2)
                
                Text("🚀").font(.largeTitle)
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
