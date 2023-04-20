//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    var calculatorBrain = CalculatorBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSliderOutlet: UISlider!
    
    @IBOutlet weak var weightSliderOutlet: UISlider!
    
    @IBAction func heightSlider(_ sender: UISlider) {
        let heightDouble = String(format: "%.1f", sender.value)
       heightLabel.text = "\(heightDouble)cm"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weightDouble = String(format: "%.1f", sender.value)
        weightLabel.text = "\(weightDouble)kg"
    }
    
    
    @IBAction func calculateIBM(_ sender: UIButton) {
        let height = heightSliderOutlet.value
        let weight = weightSliderOutlet.value
        
        calculatorBrain.caculateBMI(height: height, weight: weight)
    
        
        //Send to next screen
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIvalue()
            destinationVC.adviceValue = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}


