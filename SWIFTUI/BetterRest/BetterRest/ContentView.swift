//
//  ContentView.swift
//  BetterRest
//
//  Created by Oluwayomi M on 2023-05-14.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle  = ""
    @State private var alertMessage = "10:38 PM"
    
    static var defaultWakeTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    Text("When Do You Want To Wake Up")
                        .font(.headline)
                    
                    DatePicker("Please Enter Time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onChange(of: wakeUp){
                            _ in calculateBedTime()
                        }
                }
                Section{
                    Text("Desired Amount Of Sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        .onChange(of: sleepAmount){
                            _ in calculateBedTime()
                        }
                }
                Section{
                    Text("Daily Coffee Intake")
                        .font(.headline)
                    
//                    Stepper(coffeeAmount == 1 ? "1 Cup": "\(coffeeAmount) Cups", value: $coffeeAmount, in: 1...20)
                    Picker("Cups", selection: $coffeeAmount){
                        ForEach (1..<21){ i in
                            Text("\(i) \(i == 1 ? "Cup" : "Cups")")
                        }
                        .onChange(of: coffeeAmount){
                            _ in calculateBedTime()
                        }
                    }.pickerStyle(.wheel)
                }
                Section{
                    Text("Your Predictied Sleep Time Is \(alertMessage)")
                }
            }
            .navigationTitle("Better Rest")
            }
    }
    func calculateBedTime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction =  try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your Ideal Sleep Time Is"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        }catch{
            alertTitle = "Error"
            alertMessage = "Sorry, There was an error calculating your bed time"
            print("An Error Occur \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
