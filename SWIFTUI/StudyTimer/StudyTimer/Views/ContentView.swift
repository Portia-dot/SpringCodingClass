//
//  ContentView.swift
//  StudyTimer
//
//  Created by Oluwayomi M on 2023-04-27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var timerModel: TimerModel
    var body: some View {
        Home()
            .environmentObject(timerModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
