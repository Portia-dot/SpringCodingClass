//
//  tipBill.swift
//  greenTip
//
//  Created by Oluwayomi M on 2023-04-25.
//

import SwiftUI

struct tipBill: View {
    @StateObject var billViewModel = BillViewModel()
    @State private var showBillResult = false
    
    var body: some View {
        VStack{
            Image(systemName: "cup.and.saucer")
                .font(.system(size: 200))
                .padding(.bottom, 30)
            Text("How Much Is Your Bill ?")
                .font(Font.custom("Roboto-Bold", size: 20))
                .frame(maxWidth: .infinity, alignment: .center)
            
            TextField("0.00", text: $billViewModel.billAmountString)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
            HStack{
                Spacer()
                nextButton()
                    .padding()
                    .onTapGesture{
                        billViewModel.updateAmount(billViewModel.billAmountString)
                        showBillResult.toggle()
                    }.sheet(isPresented: $showBillResult){
                        billResult().environmentObject(billViewModel)
                            .onDisappear{
                                billViewModel.reset()
                            }
                    }
            }
        }
        .padding(.horizontal)
        .background(Color(red: 0.64, green: 0.74, blue: 0.57))
        
    }
}

struct tipBill_Previews: PreviewProvider {
    static var previews: some View {
        tipBill().environmentObject(BillViewModel())
    }
}
