//
//  TimerModel.swift
//  StudyTimer
//
//  Created by Oluwayomi M on 2023-04-27.
//

import SwiftUI

class TimerModel:  NSObject, ObservableObject {
    @Published var progress: CGFloat = 1
    @Published var timerStringValue: String = "00:00"
    @Published var hour: Int = 0
    @Published var minutes : Int = 0
    @Published var seconds : Int = 0
    @Published var isStarted: Bool = false
    
    @Published var addNewTimer: Bool = false
    
}
