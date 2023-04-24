//
//  ContentView.swift
//  DiceApp
//
//  Created by Oluwayomi M on 2023-04-23.
//

import SwiftUI

struct ContentView: View {
    @State private var rightDiceNumber : Int = 1
    @State private var leftDiceNumber : Int = 1
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    diceView(imageNumber: leftDiceNumber)
                    diceView(imageNumber: rightDiceNumber)
                }.padding(.horizontal)

                Spacer()
                Button {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                } label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }.background(Color.red)
                    .cornerRadius(10)
                Spacer()

                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct diceView: View {
    var imageNumber: Int
    var body: some View {
        Image("dice\(imageNumber)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
