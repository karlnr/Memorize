//
//  EmojiMatchGame.swift
//  Memorize
//
//  Created by Karl Northrup on 8/8/20.
//  Copyright © 2020 KNR. All rights reserved.
//

import SwiftUI

// ViewModel therefore essentually a UI thing
// use new filetype of SwiftUI View
// glues the ContentView to the MemoryGame Model
// job is to interpret the view independent of the MemoryGame file
// for the View
// ViewModel is a portal for views to get to the Model, 'a door'


class EmojiMatchGame {

    
    //not initialized, so add init() to MemoryGame
    // replace (Int) -> String placeholder from MemoryGame by creating func above
    //        MemoryGame(numberOfPairs: Int, cardContentFactory: (Int)->String)
    
    // declares a var model of type MemoryGame<String>
    // sets number of pairs to 2 and passes the functoion createCardcontent as cardContentFactory
    
    private var model: MemoryGame<String> = EmojiMatchGame.createMemoryGame()
    // add EmojiMatchGame prefix since func is static
    

    // static func makes it a function on the type instead of the instance
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🌲️", "🐦️", "🦆️", "🐻️"]   // constant array
        return MemoryGame<String>(numberOfPairs: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // MARK - Access to the cards
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK - Intent(s)
    
    func choose (card: MemoryGame<String>.Card) {
        model.choose(card: card)
        // chose takes type card, and label is card in func signature
    }

    
    
}


//struct EmojiMatchGame_Previews: PreviewProvider {
//    static var previews: some View {
//        Text("Hello, World!")
//    }
//}
