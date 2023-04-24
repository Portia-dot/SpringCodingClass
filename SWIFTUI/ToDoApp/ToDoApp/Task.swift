//
//  Task.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-24.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
