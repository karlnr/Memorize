//  EmojiMemoryGameView.swift
//  Memorize
//  Created by Karl Northrup on 8/7/20.
//

import SwiftUI


struct EmojiMemoryGameView: View {
  
  // MARK: [done] Lec 3 Reactive UI Observed
  
  // viewModel is pointer
  // Observed Object is a 'property wrapper'
  // class EmojiMemoryGame set with Observable Object protocol
  // 'redraw views every time EmojiMemoryGame publishes objecWillChange.send
  @ObservedObject var viewModel: EmojiMemoryGame      // not initialized; set in SceneDelegate
  
  // var body called by system only
  var body: some View {
    HStack {
      // ForEach takes any iterable thing;
      // if not range Int, needs Identifiable
      ForEach (viewModel.cards) { card in
          CardView(card: card).onTapGesture {     // can drop the perform: part and make inline
            viewModel.choose(card: card)  // removed self; using Xcode 12 beta 4
            // xcode 11 'requires explicit self'
          }.aspectRatio(2/3, contentMode: ContentMode.fit)
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
    GeometryReader { geometry in
      body(for: geometry.size)
    }
  }
  
  // MARK: [done] Lec 3 Body & Font Size funcs
  func body(for size: CGSize) -> some View {
    ZStack {
      if card.isFaceUp {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
        // stroke adds the line around the rec
        Text(card.content)
      } else {
        RoundedRectangle(cornerRadius: 10.0).fill()
      }
    }.font(Font.system(size: fontSize(for: size)))
        // size after 'for: ' is the func body size passed from GeometryReader
  }
  
  // MARK: [done] Lec 3 Control Panel
  let cornerRadius = 10.0
  let lineWidth = 3
  func fontSize(for size: CGSize) -> CGFloat {
    // takes CGSize from GeometryReader
    // returns a CGFloat for Font.system
    min(size.width, size.height) * 0.75
  }
  // GeometryReader & ForEach views will require self. in xcode 11
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
  }
  
}


// MARK: - LECTURE NOTES
//
// MARK: Lec 2 View Notes
//
// struct is a container for views, funcs, behaviours etc
// View is the rectangular area on screen
// var body means stored in memory
// some View means any type that behaves like a View;
// could be Text, Image, etc
//
// MARK: Lec 3 Reactive UI Notes
//
// - similarly add @ObservedObject to ModelView var viewModel
//   'I'm interested when something changes'
// - ForEach requires Identifiable to redraw cards
//
// MARK: Lec 3 Ops in Views Notes
//
// can declare var here for use within view builder;
// requires 'return' in front of ZStack { ... }
//
// example:
//  var x: Int { return 23 }
//  - Zstack is viewbuilder; function that returns a view
//  - allows if/then and listing of views; otherwise
//  - limited functionality; cannot created vars within
//
// MARK: Lec 3 Declaritive Notes
//
// modifiers rather than functions; declare rather than 'set' attributes;
// declaritive rather than imperative; independent of time
