//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jayadi Kurniawan on 29/10/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemorizeGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemorizeGameView(viewModel: game)
        }
    }
}
