//
//  nextButton.swift
//  greenTip
//
//  Created by Oluwayomi M on 2023-04-26.
//

import SwiftUI

struct nextButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width : 60)
                .foregroundColor(Color(red: 0.49, green: 0.56, blue: 0.44))
                Image(systemName: "chevron.right")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 60)
    }
}

struct nextButton_Previews: PreviewProvider {
    static var previews: some View {
        nextButton()
    }
}
