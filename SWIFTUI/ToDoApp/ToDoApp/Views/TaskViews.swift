//
//  TaskViews.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-23.
//

import SwiftUI

struct TaskViews: View {
    var body: some View {
        VStack{
            Text("My Tasks")
                .font(Font.custom("BrunoAceSC-Regular", size: 20))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 1.00, green: 0.93, blue: 0.70))
    }
}

struct TaskViews_Previews: PreviewProvider {
    static var previews: some View {
        TaskViews()
    }
}
