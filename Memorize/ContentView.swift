//
//  ContentView.swift
//  Memorize
//
//  Created by Karl Northrup on 8/7/20.
//  Copyright © 2020 KNR. All rights reserved.
//

import SwiftUI

// struct is a container for views, funcs, behaviours etc
// View is the rectangular area on screen
// var body means stored in memory
// some View means any type that behaves like a View (could be Text, etc)
struct ContentView: View {
    // viewModel is a pointer since EmojiMemoryGame is a class
    var viewModel: EmojiMemoryGame   // not initialized so set in SceneDelegate
    
    var body: some View {
        HStack {
            // ForEach takes any iterable thing, but needs to be Identifiable if not range of Int
            ForEach (viewModel.cards) { card in
                if self.viewModel.cards.count < 10 {        // large font unless 5 pairs
                    CardView(card: card).onTapGesture {     // can drop the perform: part and make inline
                        self.viewModel.choose(card: card)   // still have to  use self here 'requires explicit self'
                    }
                    .font(Font.largeTitle)
                } else {
                    CardView(card: card).onTapGesture {     // can drop the perform: part and make inline
                        self.viewModel.choose(card: card)   // still have to  use self here 'requires explicit self'
                    }
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange) // Font and Color are types,
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                // stroke adds the line around the rec
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .aspectRatio(2/3, contentMode: ContentMode.fit) // cards 2:3 width to height ratio
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
