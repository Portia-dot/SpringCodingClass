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
    // MARK: Scene Phase
    @Environment (\.scenePhase) var phase
    
    @State var lastActiveTimeStamp: Date = Date()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timerModel)
        }
        .onChange(of: phase) { newValue in
            if timerModel.isStarted{
                if newValue == .background{
                  lastActiveTimeStamp = Date()
                }
                if newValue == .active{
                  // Find the difference
                    let currentTimeStampDiff = Date().timeIntervalSince(lastActiveTimeStamp)
                    if timerModel.totalSeconds - Int(currentTimeStampDiff) <= 0{
                        timerModel.isStarted = false
                        timerModel.totalSeconds = 0
                        timerModel.isFinised = true
                    }else{
                        timerModel.totalSeconds -=  Int(currentTimeStampDiff)
                    }
                }
            }
        }
    }
}
