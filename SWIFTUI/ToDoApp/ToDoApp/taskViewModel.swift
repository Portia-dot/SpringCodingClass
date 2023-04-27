//
//  taskViewModel.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-25.
//
import Foundation
import RealmSwift
import Combine

class TaskViewModel: ObservableObject {
    private var task: Task
    private var notificationToken: NotificationToken?
    
    @Published var title: String
    @Published var completed: Bool
    
    init(task: Task) {
        self.task = task
        self.title = task.title
        self.completed = task.completed
        
        notificationToken = task.observe { change in
            switch change {
            case .change(_, let properties):
                DispatchQueue.main.async {
                    for property in properties {
                        switch property.name {
                        case "title":
                            if let newTitle = property.newValue as? String {
                                self.title = newTitle
                            }
                        case "completed":
                            if let newCompleted = property.newValue as? Bool {
                                self.completed = newCompleted
                            }
                        default:
                            break
                        }
                    }
                }
            default:
                break
            }
        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }
}
