//
//  addTaskView.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-23.
//

import SwiftUI

struct addTaskView: View {
    @State private var title: String  = ""
    @EnvironmentObject var realmManager: RealManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Create New Task")
                .font(Font.custom("BrunoAceSC-Regular", size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter Task Here", text: $title)
                .textFieldStyle(.roundedBorder)
            Button {
                if title != ""{
                    realmManager.addTask(taskTitle: title)
                }
                print("Task Add")
                dismiss()
            } label: {
                Text("Add Task")
                    .font(Font.custom("BrunoAceSC-Regular", size: 15))
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

struct addTaskView_Previews: PreviewProvider {
    static var previews: some View {
        addTaskView()
            .environmentObject(RealManager())
    }
}
