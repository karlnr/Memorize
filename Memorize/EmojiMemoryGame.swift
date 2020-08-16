//  Created by Karl Northrup on 8/8/20.
//  Copyright © 2020 KNR. All rights reserved.
//

import SwiftUI

// MARK: [done] Lec 3 Reactive UI Observable Obj
class EmojiMemoryGame: ObservableObject {
  
  // MARK: [done] Lec 3 Reactive UI Published
  // Published is a property wrapped; var model is the property
  // every time var model changes, published calls objectWillChange.send()
  @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    // add EmojiMemoryGame prefix since func is static
  
  // static func makes it a function on the type instead of the instance
  static func createMemoryGame() -> MemoryGame<String> {
    let emojis = ["🐦️", "🦆️", "🐻️", "🐶️", "🐴️"]  // constant array
    let pairs = [2,3,4,5]  // random # of pairs for each game
    return MemoryGame<String>(numberOfPairs: pairs.randomElement()! ) { pairIndex in
      return emojis[pairIndex]
    }
  }
  // replaced by propery wrapper @Published
  //var objectWillChange: ObservableObjectPublisher
  
  
  // MARK: - Access to the cards
  
  // 'publishes' var for use by View
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  // MARK: - Intent(s)
  
  func choose (card: MemoryGame<String>.Card) {
    // choose takes type card; label is card in func signature
    model.choose(card: card)
    
    // MARK: [done] Lec 3 Opt Object Will Change
    // replaced by propery wrapper @Published
    // that way dont have to insert objectwillChange.send for every func
    //objectWillChange.send()

  }
}


// MARK: - LECTURE NOTES
//
// ViewModel therefore essentually a UI thing
// use new filetype of SwiftUI View
// glues the EmojiMemoryGameView to the MemoryGame Model
// job is to interpret the view independent of the MemoryGame file
// for the View
// ViewModel is a portal for views to get to the Model, 'a door'

// constrains & gains: ObservableObject (only for classes
// system implies var objectWillChange: ObservableObjectPublisher within the class
// use objectWillChange.send() in funcs that need to be Reactive to changes
// in the model; alternatively, @Published is a 'property wrapper;
// adding @Published to private var model with publish every time model changes
// similarly add @ObservedObject to ModelView var viewModel
//
// MARK: Lec 3 Published Notes
//
// no vars declared here outside of the 'published' types for use by View
//
// MARK: Lec 2 Init Notes
//
// not initialized, so add init() to MemoryGame
// replace (Int) -> String placeholder from MemoryGame by creating func above
//   MemoryGame(numberOfPairs: Int, cardContentFactory: (Int)->String)
//
// MARK: Lec 2 Private Model Notes
//
// Model is a private var to prevent direct access by Views
// declares a var model of type MemoryGame<String>; sets number of pairs to 2;
// passes function createCardcontent as cardContentFactory
