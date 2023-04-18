//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation



struct StoryBrain{
    var currentStoryIndex : Int = 0
    
    let stories = [
        Story(
            title: "What's your favorite sport?",
            choice1: "Football",
            choice1Destination: 1,
            choice2: "Basketball",
            choice2Destination: 2
        ),
        Story(
            title: "You chose Football! You're about to play in the championship game. The crowd is cheering, and you're ready to score the winning goal. What do you do?",
            choice1: "Go for the goal",
            choice1Destination: 3,
            choice2: "Pass the ball to a teammate",
            choice2Destination: 4
        ),
        Story(
            title: "You chose Basketball! It's the final seconds of the game, and your team is down by two points. You have the ball, and the clock is ticking. What's your move?",
            choice1: "Shoot a three-pointer",
            choice1Destination: 5,
            choice2: "Drive to the hoop for a layup",
            choice2Destination: 6
        ),
        Story(
            title: "You went for the goal and scored! The crowd is going wild! What do you do next?",
            choice1: "Celebrate with your teammates",
            choice1Destination: 7,
            choice2: "Thank the coach",
            choice2Destination: 8
        ),
    ]
    mutating func getStoryText() -> Story{
        if currentStoryIndex < stories.count{
            return stories[currentStoryIndex]
        }else{
            currentStoryIndex = 0
            return stories[currentStoryIndex]
        }
        
        
    }
    mutating func userChoice(_ choice: Int){
        let currentStory = getStoryText()
        if choice == 1{
            currentStoryIndex = currentStory.choice1Destination
        }else{
            currentStoryIndex = currentStory.choice2Destination
        }
        
    }
}
