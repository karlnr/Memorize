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


// outside of the class
//func createCardContent(pairIndex: Int) -> String {
//     return "✅️"
// }

class EmojiMatchGame {

    
    //not initialized, so add init() to MemoryGame
    // replace (Int) -> String placeholder from MemoryGame by creating func above
    //        MemoryGame(numberOfPairs: Int, cardContentFactory: (Int)->String)
    
    // declares a var model of type MemoryGame<String>
    // sets number of pairs to 2 and passes the functoion createCardcontent as cardContentFactory
    
    private var model: MemoryGame<String> = MemoryGame(numberOfPairs: 2, cardContentFactory: { (pairIndex: Int) -> String in
        // move curly from after String to in front of pairIndex and add 'in' behind String
        "✅️"    // no longer need return
    })
    
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



struct EmojiMatchGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
