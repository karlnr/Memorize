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
    
    // viewModel is a pointer since EmojiMatchGame is a class
    var viewModel: EmojiMatchGame   // not initialized so set in SceneDelegate
    var body: some View {
        HStack {
            // ForEach takes any iterable thing, but needs to be Identifiable if not range of Int
            ForEach (viewModel.cards) { card in
                CardView(card: card).onTapGesture {     // can drop the perform: part and make inline
                    self.viewModel.choose(card: card)   // still have to  use self here 'requires explicit self'
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange) // Font and Color are types,
            .font(Font.largeTitle)         // orange and largeTitle are vars
        
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
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMatchGame())
    }
}
