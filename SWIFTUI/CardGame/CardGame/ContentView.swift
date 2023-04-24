//
//  ContentView.swift
//  CardGame
//
//  Created by Oluwayomi M on 2023-04-23.
//

import SwiftUI

struct ContentView: View {

    //Game Card State
 @State private var CPUNumber = 2
 @State private var PlayerNumber = 2

//Scores States
    @State private var playerScore = 0
    @State private var cupScores = 0

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                LogoView()
                Spacer()
                HStack{
                    Spacer()
                    CardView(number: PlayerNumber)
                    Spacer()
                    CardView(number: CPUNumber)
                    Spacer()
                }
                Spacer()
                DealButtonView(CPUNumber: $CPUNumber, PlayerNumber: $PlayerNumber, playerScore: $playerScore, cpuScores: $cupScores)
                Spacer()
                ScoreView(playerScore: playerScore, cpuScores: cupScores)
            }
            .padding()
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        Image("background")
            .resizable()
            .ignoresSafeArea(.all)
    }
}

struct LogoView: View {
    var body: some View {
        Image("logo")
    }
}


struct DealButtonView: View {
    @Binding var CPUNumber: Int
    @Binding var PlayerNumber: Int
    @Binding var playerScore: Int
    @Binding var cpuScores: Int
    
    var body: some View {
        Button(action: {
            self.CPUNumber = Int.random(in: 2...14)
            self.PlayerNumber = Int.random(in: 2...14)
            // Check which of this random number is greater
            
            if self.PlayerNumber > self.CPUNumber{
                self.playerScore += 1
            }else if self.playerScore < self.CPUNumber{
                self.cpuScores += 1
            }
            
        }) {
            Image("dealbutton")
                .renderingMode(.original) // To preserve the original image colors
        }
    }
}


struct ScoreView: View {
    
    var playerScore : Int
    var cpuScores : Int
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Player")
                    .padding(.bottom, 20)
                Spacer()
                Text("CPU")
                    .padding(.bottom, 20)
                Spacer()
            }.foregroundColor(.white)
                .fontWeight(.bold)
            
            HStack {
                Spacer()
                Text("\(playerScore)")
                Spacer()
                Text("\(cpuScores)")
                Spacer()
            }.foregroundColor(.white)
                .fontWeight(.heavy)
                .font(Font.system(size: 30))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CardView: View {
    var number : Int
    var body: some View {
            Image("card\(number)")
    }
}
