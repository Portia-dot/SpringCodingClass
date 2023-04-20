//
//  Players.swift
//  ClassesDemo
//
//  Created by Oluwayomi M on 2023-04-18.
//

import Foundation

class Player{
    var shootPower = 99
    var dribble = 17
    
    func pass(){
        print("He Passed")
    }
    func shoot(){
        print("Shooting \(shootPower) and scores")
    }
}
