//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alvin Ghouas on 7/14/20.
//  Copyright © 2020 Alvin Ghouas. All rights reserved.
//

//Note View model is kinda like a reducer

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemeoryGame()
    
    static func createMemeoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count, cardContentFactory: { pairIndex in
            return emojis[pairIndex]
        })
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK - Intent(s)
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
        
    }
}



struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
