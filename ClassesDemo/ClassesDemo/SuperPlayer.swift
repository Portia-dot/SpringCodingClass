//
//  SuperPlayer.swift
//  ClassesDemo
//
//  Created by Oluwayomi M on 2023-04-18.
//

class newPlayerHard: Player {
    var speed = 10
    
    func scoreGoal(goal: Int){
        print("Scores \(10) goal last season")
    }
    override func pass() {
        print("improved Passing Accuracy")
    }
}
