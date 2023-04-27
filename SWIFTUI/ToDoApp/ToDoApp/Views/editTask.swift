//
//  editTask.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-25.
//

import SwiftUI

struct editTask: View {
    @EnvironmentObject var realmManager: RealManager
    @Environment(\.dismiss) var dismiss
    
        let task: Task
        
        @Binding var isPresented: Bool
        
        @State private var newTitle: String
        
        init(task: Task, isPresented: Binding<Bool>){
            self.task = task
            _isPresented = isPresented
            _newTitle = State(initialValue: task.title)
        }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Edit Task")
                .font(Font.custom("BrunoAceSC-Regular", size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter New Task Title", text: $newTitle)
                .textFieldStyle(.roundedBorder)
            Button {
                if newTitle != "" {
                    realmManager.editTask(id: task.id, newTitle: newTitle)
                }
                print("Task updated")
                dismiss() // Use the dismiss environment variable
            } label: {
                Text("Update Task")
                    .font(Font.custom("BrunoAceSC-Regular", size: 10))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(red: 0.49, green: 0.56, blue: 0.44))
                    .cornerRadius(30)
            }
            Spacer()
            
        }.padding(.top, 40)
            .padding(.horizontal)
            .background(Color(red: 1.00, green: 0.93, blue: 0.70))
    }
}

struct editTask_Previews: PreviewProvider {
    static var previews: some View {
        editTask( task: Task(), isPresented: .constant(false))
            .environmentObject(RealManager())
    }
}
