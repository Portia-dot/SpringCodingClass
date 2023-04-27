import SwiftUI

struct pickerView: View {
    @EnvironmentObject var billViewModel: BillViewModel
    var percentage : [Int] = Array(stride(from: 0, to: 110, by: 10))
    @Binding var selectedPercentageIndex: Int
    
    var body: some View {
        VStack{
            Text("Select Percentage Of Tip To Give")
                .font(.headline)
                .padding()
            Picker("Favorite Color", selection: $selectedPercentageIndex, content: {
                            ForEach(percentage, id: \.self, content: { color in
                                Text("\(color)")
            })
            })
            .labelsHidden()
            .pickerStyle(WheelPickerStyle())
            Text("Selected Tip Percentage  \(selectedPercentageIndex)")
                .foregroundColor(Color.gray)
                .font(Font.custom("Roboto-Bold", fixedSize: 20))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}




struct pickerView_Previews: PreviewProvider {
    @State static private var selectedPercentageIndex = 0
    static var previews: some View {
        pickerView(selectedPercentageIndex: $selectedPercentageIndex)
    }
}




extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

