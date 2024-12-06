//
//  Cardify.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 03/12/24.
//

import SwiftUI

struct Cardify: ViewModifier, Animatable {
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var rotation: Double
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {        
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            // MARK: Front
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            
            // MARK: Back
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

/* 
 almost every ViewModifier has extension
 extension is good for code abstraction
 
 without extension :
 .modifier(Cardify(isFaceUp: card.isFaceUp))
 
 with extension :
 .cardify(isFaceUp: card.isFaceUp)
 
 much cleaner!
*/

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
