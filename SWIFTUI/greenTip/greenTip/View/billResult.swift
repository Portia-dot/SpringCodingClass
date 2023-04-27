//
//  billResult.swift
//  greenTip
//
//  Created by Oluwayomi M on 2023-04-25.
//

import SwiftUI

struct billResult: View {
    @EnvironmentObject var billViewModel: BillViewModel
    @State private var numberOfPeopleInt: Int = 0
    @State private var numberOfPeople: String = ""
    @State private var selectedPercentageIndex = 0
    
    let percentages: [Int] = Array(stride(from: 0, to: 100, by: 10))
    
    var body: some View {
        VStack{
            Text("Your Bill Split Is")
                .font(Font.custom("Roboto-Bold", size: 25))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            Text("\(billViewModel.spiltAmount, specifier: "%.2f")")
                .font(Font.custom("Roboto-Regular", size: 60))
                .padding()
            Text("Per Person")
                .foregroundColor(.gray)
                .font(Font.custom("Roboto-ltalic", size: 15))
                .padding()
            
            HStack{
                Text("Bill Amount")
                    .foregroundColor(.gray)
                Spacer()
                Text(billViewModel.billAmountString)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 20)
            }.font(Font.custom("Roboto-Regular", size: 20))
                .padding()
            
            HStack {
                Text("Number Of People")
                    .foregroundColor(.gray)
                Spacer()
                Picker(selection: $billViewModel.bill.numberOfPeople, label: Text("")) {
                    ForEach(1..<100) { number in
                        Text("\(number)").tag(number)
                            .foregroundColor(.black)
                    }
                }
                .labelsHidden()
                .frame(width: 60, alignment: .trailing)
                .clipped()
                .background(Color.white)
                .cornerRadius(5)
            }
            .font(Font.custom("Roboto-Regular", size: 20))
            .padding()
            Spacer()
            pickerView(selectedPercentageIndex: $billViewModel.selectedPercentageIndex)
            .font(Font.custom("Roboto-Regular", size: 20))
            .padding()

            Spacer()
            
        }.padding(.horizontal)
            .background(Color(red: 0.64, green: 0.74, blue: 0.57))
        
    }
    
}

struct billResult_Previews: PreviewProvider {
    static var previews: some View {
        billResult().environmentObject(BillViewModel())
    }
}
