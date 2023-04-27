//
//  billViewModel.swift
//  greenTip
//
//  Created by Oluwayomi M on 2023-04-26.
//

import Combine

class BillViewModel: ObservableObject {
    @Published var billAmountString: String = ""
    @Published var bill = Bill(amount: 0, numberOfPeople: 0, tipPercentage: 0)
    @Published var selectedPercentageIndex: Int = 0
    
    func updateAmount(_ newAmount: String) {
            self.billAmountString = newAmount
            if let amount = Double(newAmount) {
                self.bill.amount = amount
            } else {
                self.bill.amount = 0.0
            }
        }
    
    func updateNumberOfPeople(_ newNumber: String){
        if let numberOfPeople = Int(newNumber){
            bill.numberOfPeople = numberOfPeople
        }
    }
    func calculateSplitAmountWithTip(tipPercentage: Int) -> Double {
        let tipAmount = bill.amount * Double(tipPercentage) / 100
        let totalAmount = bill.amount + tipAmount
        return totalAmount / Double(bill.numberOfPeople)
    }
    
    func reset(){
        billAmountString = ""
        bill = Bill(amount: 0, numberOfPeople: 0, tipPercentage: 0 )
        selectedPercentageIndex = 0
    }
    
    var spiltAmount: Double {
        let tipPercentage = Double(selectedPercentageIndex) / 100
        print(tipPercentage)
        return bill.amount * (1 + tipPercentage) / Double(bill.numberOfPeople)
    }

}
