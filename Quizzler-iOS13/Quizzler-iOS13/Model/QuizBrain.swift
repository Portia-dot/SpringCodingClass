//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Oluwayomi M on 2023-04-16.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain {
    let quiz = [
            Question(text: "The Great Wall of China is visible from space with the naked eye.", answer: "False"),
            Question(text: "The capital of Australia is Sydney.", answer: "False"),
            Question(text: "The human body has 206 bones.", answer: "True"),
            Question(text: "The Earth revolves around the Sun in a perfect circle.", answer: "False"),
            Question(text: "Water boils at a temperature of 100 degrees Celsius (212 degrees Fahrenheit) at sea level.", answer: "True"),
            Question(text: "Leonardo da Vinci painted the Mona Lisa.", answer: "True"),
            Question(text: "The Nile River is the longest river in the world.", answer: "True"),
            Question(text: "The chemical formula for water is H2O.", answer: "True"),
            Question(text: "Neil Armstrong was the first human to set foot on the moon.", answer: "True"),
            Question(text: "An ostrich can fly.", answer: "False")
        ]
    var currentQuestionIndex = 0
    var scores =  0
    
    
//    let actualAnswer = quiz[currentQuestionIndex].answer
//
//    if userAnswers == actualAnswer {
//        if userAnswers == "True" {
//            trueButton.backgroundColor = .green
//            falseButton.backgroundColor = .clear
//        } else {
//            trueButton.backgroundColor = .clear
//            falseButton.backgroundColor = .green
//        }
//    } else {
//        if userAnswers == "True" {
//            trueButton.backgroundColor = .red
//            falseButton.backgroundColor = .clear
//        } else {
//            trueButton.backgroundColor = .clear
//            falseButton.backgroundColor = .red
//        }
//    }
//
//    trueButton.isEnabled = false
//    falseButton.isEnabled = false
//}
//
    mutating func checkAnswer(userAnswers: String) -> Bool{
        if userAnswers == quiz[currentQuestionIndex].answer {
            scores += 1
            return true
        }else{
            return false
        }
    }
    func getProgress()-> Float{
        let progress = Float(currentQuestionIndex + 1 ) / Float(quiz.count)
        return progress
    }
    
    func getText() -> String{
        return quiz[currentQuestionIndex].text
    }
    
    
//    func nextQuestion() {
//        questionLabel.text = quiz[currentQuestionIndex].text
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            if self.currentQuestionIndex < self.quiz.count {
//                self.questionLabel.text = self.quiz[self.currentQuestionIndex].text
//                self.trueButton.backgroundColor = .clear
//                self.falseButton.backgroundColor = .clear
//
//                let progress = getProgress()
//                self.progressBar.setProgress(progress, animated: true)
//            } else {
//                self.questionLabel.text = "You have answered all questions"
//                self.currentQuestionIndex = 0
//                self.progressBar.setProgress(0, animated:  true)
//            }
//            self.trueButton.isEnabled = true
//            self.falseButton.isEnabled = true
//        }
//    }
    
    mutating func checkQuestionNext() {
        if currentQuestionIndex + 1 < quiz.count {
            currentQuestionIndex += 1
            print("hey")// Increment currentQuestionIndex by 1
        } else {
            currentQuestionIndex = 0
            scores = 0
        }
    }
    mutating func score (userAnswers: String) -> Bool{
        if userAnswers == quiz[currentQuestionIndex].answer {
            scores += 1
            return true
        }else{
            return false
        }
    }

}
