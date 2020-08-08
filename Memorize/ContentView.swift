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
    var body: some View {
        
        HStack {
            ForEach (0..<4) { index in
                CardView(isFaceUp: true)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
        
    }
}


struct CardView: View {
    var isFaceUp: Bool   // var outside of the body
    var body: some View {
            
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                // stroke adds the line around the rec
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
        
    }
}






























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
