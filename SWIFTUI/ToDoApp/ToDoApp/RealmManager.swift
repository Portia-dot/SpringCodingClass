//
//  RealmManager.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-24.
//

import Foundation
import RealmSwift

class RealmManger: ObservableObject{
    private(set) var localRealm: Realm?
    
    init(){
        openRealm()
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
    
    func addTask(taskTitle: String){
        
    }
}
