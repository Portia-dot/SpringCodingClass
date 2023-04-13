//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer!

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton){
        //        print(sender.currentTitle)
        //        playSound()
        if let title = sender.currentTitle{
            print(title)
            playSound(resourceName: title)
            
        }
    }
    
    func playSound(resourceName: String ){
        let url = Bundle.main.url(forResource: resourceName, withExtension: "wav")
        do{
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    func changeOpacity(sender: UIButton){
        sender.alpha = sender.alpha * 0.3
        
        DispatchQueue.main.asyncAfter(deadline: .now() +  0.5){
            sender.alpha = 1.0
        }
    }
}

