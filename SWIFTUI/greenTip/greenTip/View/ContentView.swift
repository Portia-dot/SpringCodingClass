//
//  ContentView.swift
//  greenTip
//
//  Created by Oluwayomi M on 2023-04-25.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount: String = ""
    var body: some View {
        VStack {
           tipBill()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
