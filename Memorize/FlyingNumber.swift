//
//  FlyingNumber.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 05/12/24.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        if number != 0 {
            // .sign(strategy: .always()) --> to show the + or -
            Text(number, format: .number.sign(strategy: .always()))
                .font(.largeTitle)
                .foregroundStyle(number < 0 ? .red : .green)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1.5, x: 1, y: 1)
                .offset(x: 0, y: offset)
                .opacity(offset != 0 ? 0 : 1)
                .onAppear {
                    withAnimation(.easeOut(duration: 1.5)) {
                        offset = number < 0 ? 200 : -200
                    }
                }
                .onDisappear {
                    offset = 0
                }
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
