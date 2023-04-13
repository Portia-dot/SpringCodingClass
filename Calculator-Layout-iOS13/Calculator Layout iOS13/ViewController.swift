//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var working: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearall()
    }
    
    func clearall(){
        working = ""
        OperationResult.text = ""
    }
    func addWorking(value :String){
        working = working + value
        OperationResult.text = working
        
    }

    @IBAction func clearAll(_ sender: Any) {
        clearall()
        
    }
    @IBOutlet weak var OperationResult: UILabel!
    
    @IBAction func equalTap(_ sender: Any) {
        let expression = NSExpression(format: working)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultStrings = resultString(result: result)
        OperationResult.text = resultStrings
        
    }
    
    @IBAction func one(_ sender: Any) {
        addWorking(value: "1")
    }
    @IBAction func two(_ sender: Any) {
        addWorking(value: "2")
    }
    @IBAction func three(_ sender: Any) {
        addWorking(value: "3")
    }
    
    @IBAction func four(_ sender: Any) {
        addWorking(value: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        addWorking(value: "5")
    }
    
    @IBAction func six(_ sender: Any) {
        addWorking(value: "6")
    }
    @IBAction func seven(_ sender: Any) {
        addWorking(value: "7")
    }
    @IBAction func eight(_ sender: Any) {
        addWorking(value: "8")
    }
    @IBAction func nine(_ sender: Any) {
        addWorking(value: "9")
    }
    
    @IBAction func mutiply(_ sender: Any) {
        addWorking(value: "*")
    }
    @IBAction func subtract(_ sender: Any) {
        addWorking(value: "-")
    }
    
    @IBAction func add(_ sender: Any) {
        addWorking(value: "+")
    }
    @IBAction func divide(_ sender: Any) {
    }
    func resultString(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
}
