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
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color(.white))
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                
                Text("🚀").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color(.systemPink))
            }
            
        }
        .foregroundColor(.pink)
        .padding()
    }
}

#Preview {
    ContentView()
}
