//
//  addButton.swift
//  ToDoApp
//
//  Created by Oluwayomi M on 2023-04-24.
//

import SwiftUI

struct addButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(red: 0.49, green: 0.56, blue: 0.44))
                Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 50)
    }
}

struct addButton_Previews: PreviewProvider {
    static var previews: some View {
        addButton()
    }
}
