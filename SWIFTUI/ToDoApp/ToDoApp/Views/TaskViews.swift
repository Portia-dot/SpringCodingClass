//
//  TaskViews.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-23.
//
import SwiftUI

struct TaskViews: View {
    @EnvironmentObject var realmManager: RealManager
    
    @State private var showEditTask = false
    @State private var selectedTask: Task?

    var body: some View {
        VStack {
            Text("My Tasks")
                .font(Font.custom("BrunoAceSC-Regular", size: 20))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            List {
                ForEach(realmManager.tasks.indices, id: \.self) { index in
                    let task = realmManager.tasks[index]
                    TaskRows(taskViewModel: TaskViewModel(task: task))
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                realmManager.deleteTask(id: task.id)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            Button {
                                showEditTask.toggle()
                                selectedTask = task
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                        .onTapGesture {
                            realmManager.updateTask(id: task.id, completed: !task.completed)
                        }
                }
                .listRowSeparator(.hidden)
            }
            .sheet(item: $selectedTask) { task in
                editTask(task: task, isPresented: $showEditTask)
                    .environmentObject(realmManager)
            }
            .refreshable {
                // Reload the list when user performs a pull-to-refresh action
                realmManager.loadTasks()
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 1.00, green: 0.93, blue: 0.70))
        .navigationViewStyle(.stack)
    }
}

struct TaskViews_Previews: PreviewProvider {
    static var previews: some View {
        TaskViews()
            .environmentObject(RealManager())
    }
}
