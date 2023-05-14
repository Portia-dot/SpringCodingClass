//
//  ContentView.swift
//  BetterRest
//
//  Created by Oluwayomi M on 2023-05-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                        trivialExample()
                    }) {
                        Text("Testing Function")
                    }
        }
        .padding()
    }
    func trivialExample(){
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
        print(date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
