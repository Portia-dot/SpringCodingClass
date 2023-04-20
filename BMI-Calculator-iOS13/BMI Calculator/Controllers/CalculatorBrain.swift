//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Oluwayomi M on 2023-04-19.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    
    var bmiValue: BMI?
    
    
    mutating func caculateBMI(height: Float, weight: Float){
        let bmi = weight / (height * height)
        let advice: String
        let color: UIColor
        
        if bmi < 18.5 {
            advice = "You're underweight."
            color = .blue
        } else if bmi < 24.9 {
            advice = "You have a normal weight."
            color = .green
        } else if bmi < 29.9 {
            advice = "You're overweight."
            color = .orange
        } else {
            advice = "Consider consulting a doctor."
            color = .red
        }
        
        bmiValue = BMI(value: bmi, advice: advice, color: color)
    }
    
    func getBMIvalue() -> String{
        let bmiResult = String(format: "%.1f", bmiValue?.value ?? "0.0")
        return bmiResult
    }
    
    func getAdvice() -> String{
        return bmiValue?.advice ?? "Error"
    }
    
    func getColor() -> UIColor {
        return bmiValue!.color
    }
}


