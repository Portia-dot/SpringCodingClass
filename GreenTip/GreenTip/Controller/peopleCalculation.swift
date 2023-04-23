//
//  peopleCalculation.swift
//  GreenTip
//
//  Created by Oluwayomi M on 2023-04-21.
//

import UIKit

class peopleCalculation: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var mealPrice : Float = 0.0
    
    @IBOutlet weak var pickerView: UIPickerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(mealPrice)
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + 1)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let numberOfPeople = row + 1
        print("Selected Numver of People is : \(numberOfPeople)")
    }
    //Next Page
    
    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: "secondView", sender: self)
        
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
}
   

    
