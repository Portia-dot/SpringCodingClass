//
//  Home.swift
//  StudyTimer
//
//  Created by Oluwayomi M on 2023-04-27.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var timerModel: TimerModel
    var body: some View {
        VStack{
            Text("Study Timer")
                .font(.title2.bold())
                .foregroundColor(.white)
            GeometryReader{ proxy in
                VStack(spacing: 15) {
                //Timer Ring
                    ZStack{
                        Circle()
                            .fill(.white.opacity(0.03))
                            .padding(-40)
                        Circle()
                            .trim(from: 0, to: timerModel.progress)
                            .stroke(.white.opacity(0.03), lineWidth: 80 )
                        //Shadow
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(Color(red: 0.55, green: 0.09, blue: 0.45), lineWidth: 15)
                            .blur(radius: 15)
                            .padding()
                        
                        Circle()
                            .fill(Color(red: 0.44, green: 0.29, blue: 0.78))
                        
                        Circle()
                            .trim(from: 0, to: timerModel.progress)
                            .stroke(Color(red: 0.55, green: 0.09, blue: 0.45).opacity(0.7), lineWidth: 10)
                        
                        //MARK: Knob
                        
                        GeometryReader{ proxy in
                            let size = proxy.size
                            Circle()
                                .fill(Color(red: 0.55, green: 0.09, blue: 0.45))
                                .frame(width: 30, height: 30)
                                .overlay(content: {
                                    Circle()
                                    .fill(.white)
                                    .padding(5)
                                    
                                })
                                .frame(width: size.width, height: size.height, alignment: .center)
                                .offset(x: size.height / 2)
                                .rotationEffect(.init(degrees: timerModel.progress * 360))
                        }
                        Text(timerModel.timerStringValue)
                            .font(.system(size: 45, weight:  .light))
                            .rotationEffect(.init(degrees: -90))
                            .animation(.none, value: timerModel.progress)
                        }
                    .padding(60)
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeInOut, value: timerModel.progress)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                    Button {
                        if timerModel.isStarted{
                            
                        }else{
                            timerModel.addNewTimer = true
                        }
                    } label: {
                        Image(systemName: !timerModel.isStarted ? "timer" : "pause")
                            .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .background{
                            Circle()
                                .fill(Color(red: 0.55, green: 0.09, blue: 0.45))
                        }
                        .shadow(color: Color(red: 0.55, green: 0.09, blue: 0.45), radius: 8, x: 0, y: 0)
                    }

                    
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
            }
            
        }.preferredColorScheme(.dark)
            .padding()
            .background{
                Color(red: 0.44, green: 0.29, blue: 0.78).ignoresSafeArea()
            }
            .overlay {
                ZStack{
                    Color.black
                        .opacity(timerModel.addNewTimer ? 0.25 : 0)
                        .onTapGesture {
                            timerModel.addNewTimer = false
                        }
                    
                    NewTimerView()
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: timerModel.addNewTimer ? 0 : 400)
                }
                .animation(.easeInOut, value: timerModel.addNewTimer)
            }
            .preferredColorScheme(.dark)
        }
    
    
    //  NewSheet For Timer
    @ViewBuilder
    func NewTimerView()->some View{
        VStack(spacing: 15) {
            Text("Add New Timer")
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding(.top, 10)
            
            HStack(spacing: 15) {
                Text("\(timerModel.hour) hr")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(Capsule().fill(Color.white.opacity(0.07)))
                    .contextMenu {
                        ContextMenuOption(maxValue: 12, hint: "hr") { value in
                            timerModel.hour = value 
                        }
                    }
                Text("\(timerModel.minutes) min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.07))
                    }
                    .contextMenu {
                        ContextMenuOption(maxValue: 60, hint: "min") { value in
                            timerModel.minutes = value
                        }
                    }

                Text("\(timerModel.seconds) sec")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.07))
                    }
                    .contextMenu {
                        ContextMenuOption(maxValue: 60, hint: "sec") { value in
                            timerModel.seconds = value
                        }
                    }

            }
            .padding(.top, 20)
            
            Button {
                print("Button pressed")
            } label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal,100)
                    .background{
                        Capsule()
                            .fill(Color(red: 0.55, green: 0.09, blue: 0.45))
                    }
            }
            .disabled(timerModel.seconds == 0)
            .opacity(timerModel.seconds == 0 ? 0.5 : 1)
            .padding(.top)


        }
        .padding()
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(red: 0.44, green: 0.29, blue: 0.78))
                .ignoresSafeArea()
        }
            
    }
    
//    //Reuseable Context Menu Option
//    func ContextMenuOption(maxValue: Int, hint: String, onClick: @escaping (Int) -> ()){
//        ForEach(0...maxValue, id: \.self){ value in
//            Button("\(value) \(hint)"){
//                onClick(value)
//            }
//        }
    
    @ViewBuilder
    func ContextMenuOption(maxValue: Int, hint: String, onClick: @escaping (Int) -> ()) -> some View {
        ForEach(0...maxValue, id: \.self) { value in
            Button("\(value) \(hint)") {
                onClick(value)
            }
        }
    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TimerModel())
    }
}
