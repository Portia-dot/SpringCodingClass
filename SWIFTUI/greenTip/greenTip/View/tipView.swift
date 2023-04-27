//
//  tipView.swift
//  greenTip
//
//  Created by Oluwayomi M on 2023-04-25.
//

import SwiftUI

struct tipView: View {
    var body: some View {
        VStack{
            Text("Green Tip")
                .font(Font.custom("Roboto-Regular", size: 20))
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.64, green: 0.74, blue: 0.57))
    }
}

struct tipView_Previews: PreviewProvider {
    static var previews: some View {
        tipView()
    }
}
