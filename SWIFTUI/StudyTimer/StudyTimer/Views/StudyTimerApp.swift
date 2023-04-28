//
//  StudyTimerApp.swift
//  StudyTimer
//
//  Created by Oluwayomi M on 2023-04-27.
//

import SwiftUI

@main
struct StudyTimerApp: App {
    @StateObject var timerModel: TimerModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timerModel)
        }
    }
}
