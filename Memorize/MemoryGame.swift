//  Created by Karl Northrup on 8/8/20.
//  Copyright © 2020 KNR. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> {  // <Element> is a 'dont care type'
  // array of cards
  var cards: Array<Card>  // array, doesnt care what card type
  
  // func that can be used by others to act on a card
  mutating func choose(card: Card) { // should be _ card: to conform to API
    // MARK: TODO: Lec 3 Flip Card
    let chosenIndex: Int = index(of: card)  // func uses external name 'of'
    cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    print("card chosen \(card)")
  }

  // MARK: TODO: Lec 3 Index Of Func
  func index(of card: Card) -> Int {  // 'of' is external name; 'card' is internal name
    for i in 0..<cards.count {
      if cards[i].id == card.id {  // uses internal name
        return i
      }
    }
    return 0  // TODO: Lec 3 fix return
  }

  
  
  // pass a function (Int) -> CardContent to init
  init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
    for pairIndex in 0..<numberOfPairs {
      let content = cardContentFactory(pairIndex)
      // content doesnt vary on each iteration so use let
      // dont have to declare type CardContent because of type inference
      cards.append(Card(content: content, id: pairIndex*2))
      cards.append(Card(content: content, id: pairIndex*2+1))
      cards.shuffle()     // array shuffle
    }
  }
  
  // MARK: TODO: Lect 4 return trick
  
  struct Card: Identifiable {
    var isFaceUp: Bool = true
    var isMatched: Bool = false
    var content: CardContent  // dont care what type of content
    var id: Int  // make identifiable for the ForEach in EmojiMemoryGameView
    // example of 'constrains and gains'
  }
  
}

// MARK: - LECTURE NOTES
//
// the Model and 'logic' of the app
// therefore standard Swift file; no SwiftUI view elements or imports
// goal: determines card content and status of cards
// uses: array of cards and choose function, and card type
//
// struct Card
// - cards have these parameters
// - include within MemoryGame struct so we know it is a MemoryGame Card type
//
// MARK: Lec 3 - Mutating Func Notes
//
// Mutating Structs
// - cards is an Array & mutable; Card is a struct; all structs are copies;
//   accessing card here is accessing a copy of card from the array;
//   cannot toggle isFaceUp directly with card.IsFaceUp; requires self._
// - copy behaviour is copy-on-write, so mutating with self._ doesn't
//   actually change the value bitwise when declared; only when something is changed;
//   all funcs modifying structs incl 'self' need 'mutating func'
// - all inits are implicit mutating funcs
// - let... Card = self.card; copies the card
// - index of as _ internal label;
// - index func is an external label
