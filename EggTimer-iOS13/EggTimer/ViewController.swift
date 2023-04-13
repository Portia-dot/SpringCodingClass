//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    let eggTimes = ["Soft": 1, "Medium": 7,"Hard": 12]
    var secondInTime = 60
    var totalNumber = 60
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCircularProgressBar()
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let cookTime = sender.currentTitle!
        let result = eggTimes[cookTime]!
        secondInTime = result * 60
        totalNumber = secondInTime
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        if secondInTime > 0 {
            print("\(secondInTime) seconds.")
            let percentage = 100 - Int((CGFloat(secondInTime) / CGFloat(totalNumber)) * 100)
                    shapeLayer.strokeEnd = CGFloat(percentage) / 100
                    percentageLabel.text = "\(percentage)%"
            
//            percentageLabel.text = String(format: "%.0f%%", progress * 100)
            secondInTime -= 1
        }
        if secondInTime == 0 {
            print("Done")
            percentageLabel.text = "Egg Is Ready"
            timer.invalidate()
        }
    }
    //Percentage
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    
    
    func setupCircularProgressBar() {
        let xOffset: CGFloat = 0
        let yOffset: CGFloat =  200
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: view.center.x + xOffset, y: view.center.y + yOffset), radius: 70, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)
        
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)

        // Add the label to the view hierarchy
        view.addSubview(percentageLabel)

        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(percentageLabel)
        
        // Set the constraints for the label
        NSLayoutConstraint.activate([
            percentageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset),
            percentageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset)
            ])
    }

    
    
}
