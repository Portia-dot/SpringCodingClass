//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Oluwayomi M on 2023-05-09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScores =  false
    @State private var scoreTitle =  ""
    @State private var scores  = 0
    @State private var questionsAnswered = 0
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
            ZStack{
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.75, green: 0.15, blue: 0.13), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
                VStack{
                    Text("Guess Flag")
                        .font(.title.bold())
                        .foregroundStyle(.regularMaterial)
                    Spacer()
                    VStack(spacing: 15){
                        VStack {
                            Text("Tap The Flag Of")
                                .font(.title.weight(.semibold))
                                .foregroundColor(.black)
                            Text(countries[correctAnswer])
                                .font(.title.weight(.bold))
                                .foregroundStyle(.regularMaterial)
                        }
                        .foregroundColor(.white)
                        ForEach(0..<3){ number in
                            Button{
                                //Flag was tapped
                                flagTapped(number)
                            }label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                    .shadow(radius: 10)
                            }
                        }
                    }
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                    Spacer()
                    Text("Your Score Is : \(scores)")
                    Spacer()
                }
                   
                
        }
            .alert(isPresented: $showingScores) {
                Alert(
                    title: Text(scoreTitle),
                    message: alertMessage(),
                    dismissButton: .default(Text("Continue"), action: {
                        if scoreTitle == "Game Over"{
                            restartGame()
                            scores = 0
                        }else{
                            askQuestion()
                        }
                    })
                )
            }
        
    }
    
    func alertMessage() -> Text{
        if scoreTitle == "Wrong"{
            return Text("The Correct Flag index \(correctAnswer + 1 )\n Your Score Is \(scores)")
        }else if scoreTitle == "Game Over" {
            return Text("Your Total Score Is \(scores) out of 8")
        }else{
            return Text("Your Score Is \(scores)")
        }
    }
                                  
    func flagTapped(_ number: Int){
        if number ==  correctAnswer{
            scoreTitle = "Correct"
            scores += 1
        }else{
            scoreTitle = "Wrong"
        }
        restartGame()
        print(questionsAnswered)
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        if questionsAnswered == 7 {
            questionsAnswered = 0
            showingScores = true
            scoreTitle = "Game Over"
        } else {
            questionsAnswered += 1
            showingScores = true
            askQuestion()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
