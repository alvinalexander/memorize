//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Alvin Ghouas on 7/13/20.
//  Copyright © 2020 Alvin Ghouas. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        Grid(items: viewModel.cards) { card in
                CardView(card:card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
        
            .padding()
            .foregroundColor(Color.orange) //passed down
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
        
    }
    
    func body(for size: CGSize) -> some View {
        return ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth)
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
        .font(Font.system(size: self.fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    func fontSize(for size:CGSize) -> CGFloat {
         min(size.width, size.height) * self.fontScaleFactor
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
