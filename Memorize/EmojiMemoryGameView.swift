//  EmojiMemoryGameView.swift
//  Memorize
//  Created by Karl Northrup on 8/7/20.


// MARK: Lec 2 View Notes
/*  struct is a container for views, funcs, behaviours etc
 View is the rectangular area on screen
 var body means stored in memory
 some View means any type that behaves like a View (could be Text, etc)
 */

// MARK: Lec 3 Reactive UI Notes
/*  similarly add @ObservedObject to ModelView var viewModel
 'I'm interested when something changes'
 ForEach requires Identifiable to redraw cards
 */

// MARK: Lec 3 Ops in Views Notes
/*   can declare var here for use within view builder; requires 'return'
 in front of ZStack { ... }
 example:
 var x: Int { return 23 }
 Zstack is viewbuilder; function that returns a view
 allows if/then and listing of views; otherwise
 limited functionality; cannot created vars within
 */

// MARK: Lec 3 Declaritive Notes
/*  modifiers rather than functions; declare rather than 'set' attributes;
 declaritive rather than imperative; independent of time
 */

import SwiftUI

struct EmojiMemoryGameView: View {
  
  // MARK: TODO Lec 3 Reactive UI Observed
  
  // viewModel is pointer
  var viewModel: EmojiMemoryGame      // not initialized; set in SceneDelegate
  
  // var body called by system only
  var body: some View {
    HStack {
      // ForEach takes any iterable thing;
      // if not range Int, needs Identifiable
      ForEach (viewModel.cards) { card in
        if self.viewModel.cards.count < 10 {        // large font unless 5 pairs
          CardView(card: card).onTapGesture {     // can drop the perform: part and make inline
            self.viewModel.choose(card: card)
            // xcode 11 'requires explicit self'
          }
          .font(Font.largeTitle)
        } else {
          CardView(card: card).onTapGesture {     // drop 'perform:' make inline
            self.viewModel.choose(card: card)
          }
        }
      }
    }
    .padding()
    .foregroundColor(Color.orange) // Font and Color are types,
  }
}

// MARK: TODO: Lec 3 GeometryReader & Font
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
  
  // MARK: TODO: Lec 3 Control Panel
  // move 'magic numbers' to vars and lets (3x)
  // MARK: TODO: Lec 3 Body & Font Size funcs
  // GeometryReader & ForEach views will require self. in xcode 11
  
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
  }
}
