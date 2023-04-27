//
//  RealmManager.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-24.
//

import Foundation
import RealmSwift

class RealManager: ObservableObject{
    private(set) var localRealm: Realm?
    
    @Published private(set) var tasks: [Task] = []
    
    init(){
        openRealm()
        getTasks()
    }
    
    
    
    func openRealm() {
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        }catch{
            print("Error Opening Realm")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                let newTask = Task(value: ["title": taskTitle, "completed": false])
                try localRealm.write {
                    localRealm.add(newTask)
                    print("New Task Added \(newTask)")
                }
                DispatchQueue.main.async {
                    self.tasks.append(newTask)
                    self.tasks = self.tasks.sorted(by: { $0.completed == $1.completed })
                }
                getTasks()
            } catch {
                print("Error opening realm \(error)")
            }
        }
    }


    func getTasks(){
        if let localRealm = localRealm{
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            DispatchQueue.main.async {
                self.tasks = Array(allTasks)
            }
        }
    }
    func updateTask(id: ObjectId, completed: Bool){
        if let localRealm = localRealm{
            do{
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard let task = taskToUpdate.first else {return}
                guard !taskToUpdate.isEmpty else {return}
                try localRealm.write{
                    task.completed = completed
                    print("Updated task with id \(id)! Compeleted Status \(completed)")
                }
                getTasks()
            }catch{
                print("Error updating \(id) realm \(error)")
            }
        }
    }
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.object(ofType: Task.self, forPrimaryKey: id)
                
                if let task = taskToDelete, !task.isInvalidated {
                    try localRealm.write {
                        localRealm.delete(task)
                        print("Task deleted: \(id)")
                    }
                } else {
                    print("Task not found or already deleted: \(id)")
                }
            } catch {
                print("Error deleting Task id \(id) from Realm: \(error)")
            }
        }
    }


    //Edit
    
    func editTask(id: ObjectId, newTitle: String){
        if let localRealm = localRealm{
            do{
                let taskToEdit =  localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id)).first
                guard let task = taskToEdit else{return}
                
                try localRealm.write{
                    task.title = newTitle
                    print("Task With Id \(id) has been updated")
                }
            }catch{
                print("Error Updating task with id \(id)  in realm: \(error)")
            }
        }
    }
    func loadTasks() {
            getTasks()
        print("called")
        }
}
