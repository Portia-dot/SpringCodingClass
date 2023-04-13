//
//  CountryDetailView.swift
//  Lesson_One
//
//  Created by Oluwayomi M on 2023-03-31.
//

import SwiftUI

struct CountryDetailView: View {
    let country: CountryData
    
    var body: some View {
        VStack {
            Text(countryCodeToFlagEmoji(countryCode: country.code))
                .font(.system(size: 100))
            Text(country.name)
                .font(.title)
                .fontWeight(.bold)
            Text("Code: \(country.code)")
                .font(.subheadline)
            Text("Currency Codes: \(country.currencyCodes.joined(separator: ", "))")
                .font(.subheadline)
        }
        .padding()
        .navigationBarTitle("Country Details", displayMode: .inline)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: CountryData(id: "Q889", code: "AF", currencyCodes: ["AFN"], name: "Afghanistan"))
    }
}
