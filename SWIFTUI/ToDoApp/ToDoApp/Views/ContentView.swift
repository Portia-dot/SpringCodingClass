//
//  ContentView.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManager = RealManager()
    @State private var showAddTask = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TaskViews()
                .environmentObject(RealManager())
            
            addButton()
                .padding()
                .onTapGesture {
                    showAddTask.toggle()
                }
                .sheet(isPresented: $showAddTask) {
                    addTaskView()
                        .environmentObject(RealManager()
                        )
                }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(Color(red: 1.00, green: 0.93, blue: 0.70))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
