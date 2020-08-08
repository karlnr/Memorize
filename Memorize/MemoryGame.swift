//
//  MemoryGame.swift
//  Memorize
//
//  Created by Karl Northrup on 8/8/20.
//  Copyright © 2020 KNR. All rights reserved.
//

import Foundation

// the Model and 'logic' of the app
// therefore standard Swift file, no SwiftUI view elements or imports
// goal: determines card content and status of cards
// uses: array of cards and choose function, and card type

struct MemoryGame<CardContent> {   // <Element> is a 'dont care type'
    
    // array of cards
    var cards: Array<Card>  // array, doesnt care what card type
    
    
    // pass a function (Int) -> CardContent to init
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentFactory(pairIndex)
            // content doesnt vary on each iteration so use let
            // dont have to declare type CardContent because of type inference
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
        }
    }
    
    // func that can be used by others to act on a card
    func choose(card: Card) -> Void {   // returns nothing
        print("card chosen \(card)")
    }
    

    // cards have these parameters, include within MemoryGame struct
    // so we know it is a MemoryGame Card type
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent    // dont care what type of content
    }
    
    
}
