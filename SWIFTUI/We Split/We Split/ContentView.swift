//
//  ContentView.swift
//  We Split
//
//  Created by Oluwayomi M on 2023-05-05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage =  20
    
    let tipPercentages = [10, 20, 30, 40, 15, 5, 0]
    
    var totalPerPerson: Double {
        let tipSelection = Double(tipPercentage)
        let peopleCount = Double(numberOfPeople + 1)

        // Use optional binding to handle empty or invalid checkAmount
        let checkAmountValue = Double(checkAmount)

        let tipValue = checkAmountValue / 100 * tipSelection
        let grandTotal = checkAmountValue + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }


    
    
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Enter Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.numberPad)
                    
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(1 ..< 100) { number in
                            Text("\(number) people")
                        }
                    }
                }
                Section{
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercentages.sorted(), id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How Much Tip Do You Want To Leave? ")
                }
                Section{
                    Text(totalPerPerson, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
