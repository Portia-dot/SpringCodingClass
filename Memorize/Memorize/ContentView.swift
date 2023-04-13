//
//  ContentView.swift
//  Memorize
//
//  Created by Oluwayomi M on 2022-08-06.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🚕", "🚙", "🚌","🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅", "🚈", "🚂", "🚆", "🚇", "🚊", "🚉", "🚁", "🛩", "✈️", "🛫", "🛬", "🚀", "🛰", "💺", "🛶", "⛵️", "🛥", "🚤", "🛳", "⛴", "🚢", "⚓️", "🚧", "⛽️", "🚏", "🚦", "🚥", "🗺", "🗿", "🗽", "⛲️", "🗼", "🏰", "🏯", "🏟", "🎡", "🎢", "🎠", "⛱", "🏖", "🏝", "⛰", "🏔", "🗻", "🌋", "🏜", "🏕", "⛺️", "🛤", "🛣", "🏗", "🏭", "🏠", "🏡", "🏘", "🏚", "🏢", "🏬", "🏣", "🏤", "🏥", "🏦", "🏨", "🏪", "🏫", "🏩", "💒", "🏛", "⛪️", "🕌", "🕍", "🕋", "⛩", "🗾", "🎑", "🏞", "🌅", "🌄", "🌠", "🎇", "🎆", "🌇", "🌆", "🏙", "🌃", "🌌", "🌉", "🌁","🦗","🛸","🛷","🥌"]
    
    @State var emojiCount: Int = 4
    var body: some View {
        VStack{
            HStack{
                ForEach (emojis[0..<emojiCount], id: \.self ){ emoji in
                    CardView(content: emoji)
                    
                }
            }
            
            HStack{
                remove
                Spacer()
                add
                
            }.padding(.horizontal)
                .font(.largeTitle)
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
    var remove: some View{
        Button {
            emojiCount -= 1
            
        } label: {
            Image(systemName: "minus.circle")
            
        }
    }
    var add:some View{
        Button {
            emojiCount += 1
        } label: {
            Image(systemName: "plus.circle")
            
        }
    }
}



struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    var body:some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            }else{
                shape
                    .fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
