//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Oluwayomi M on 2023-04-19.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var adviceValue: String?
    var color : UIColor?
    

    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let backgroundColor = color {
               self.view.backgroundColor = backgroundColor
           }

        // Do any additional setup after loading the view.
        
        bmiLabel.text = bmiValue
        adviceLabel.text = adviceValue
        adviceLabel.lineBreakMode = .byWordWrapping
        
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
