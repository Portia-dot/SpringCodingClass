//
//  ContentView.swift
//  greenCardApp
//
//  Created by Oluwayomi M on 2023-04-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.5)
                .ignoresSafeArea(.all)
            VStack {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                VStack {
                    Text("Modamori Oluwayomi")
                        .font(Font.custom("BrunoAceSC-Regular", size: 20))
                        .bold()
                    Text("Data Scientist & IOS Developer")
                        .font(.system(size: 12))
                }.foregroundColor(.white)
                
                
                Divider()
                
//                Text("+1 306 261 2371")
//                    .font(Font.custom("BrunoAceSC-Regular", size: 15))
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .clipShape(Rectangle())
//                    .overlay(Rectangle().stroke(Color.white, lineWidth:  2))
                infoView(text: "+1 235 564 3434", imageName: "phone.fill")
                Divider()
                infoView(text: "mop10@icloud.com", imageName: "mail.fill")
                
            }
            .padding()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct infoView: View {
    let text: String
    let imageName: String
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                        .padding()
                    Text(text)
                        .fontWeight(.bold)
                        .font(.custom("BrunoAceSC-Regular", size: 15))
                }
            )
    }
}
