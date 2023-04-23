//
//  ViewController.swift
//  GreenTip
//
//  Created by Oluwayomi M on 2023-04-20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var getMealAmount: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureInputAccessoryView()
        getMealAmount.delegate = self
    }


    @IBAction func nextIsClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "peopleCalculation", sender: self)
        if let amount = getAmount(){
            print(amount)
        }
    }
    //Setting the dollarSign on the left side
    
    func configureInputAccessoryView() {
        let dollarSign = UILabel()
        dollarSign.sizeToFit()
        
        getMealAmount.leftView = dollarSign
        getMealAmount.leftViewMode = .always
        
        getMealAmount.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
     
    @objc func textFieldDidChange(_ textField: UITextField) {
        if !textField.text!.hasPrefix("$") {
            textField.text = "$" + textField.text!
        }
    }

    //Get Amount With Dollar Sign
    
    func getAmount() -> Float? {
        if let text = getMealAmount.text{
            let amountWithoutDollar = text.replacingOccurrences(of: "$", with: "")
            if let amount = Float(amountWithoutDollar){
                return amount
            }
        }
        return nil
    }
    // Pass To Next Page
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "peopleCalculation" {
            if let destinationVC = segue.destination as? peopleCalculation,
               let enteredNumber = getAmount(){
                destinationVC.mealPrice = enteredNumber
            }
        }
    }

}

