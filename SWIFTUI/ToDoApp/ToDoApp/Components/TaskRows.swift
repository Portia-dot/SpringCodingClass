//
//  TaskRows.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-23.
//

import SwiftUI


struct TaskRows: View {
  @ObservedObject var taskViewModel : TaskViewModel  
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: taskViewModel.completed ? "checkmark.circle" : "circle")
            Text(taskViewModel.title)
                .font(Font.custom("BrunoAceSC-Regular", size: 15))
        }
    }
}

struct TaskRows_Previews: PreviewProvider {
    static var previews: some View {
        TaskRows(taskViewModel: TaskViewModel(task: Task()))
    }
}
