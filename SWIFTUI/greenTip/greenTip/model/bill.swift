//
//  bill.swift
//  greenTip
//
//  Created by Oluwayomi M on 2023-04-26.
//

import Foundation

struct Bill{
    var amount: Double
    var numberOfPeople: Int
    var tipPercentage: Double
    
    func splitAmount() -> Double {
        return amount * (1 + tipPercentage) /  Double(numberOfPeople)
    }
}
