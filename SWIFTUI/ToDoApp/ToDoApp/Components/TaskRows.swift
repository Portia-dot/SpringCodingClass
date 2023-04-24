//
//  TaskRows.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-23.
//

import SwiftUI


struct TaskRows: View {
    var task : String
    var completed : Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: completed ? "checkmark.circle" : "circle")
            Text(task)
        }
    }
}

struct TaskRows_Previews: PreviewProvider {
    static var previews: some View {
        TaskRows(task: "Read Some Book", completed: true)
    }
}
