//
//  CountryView.swift
//  Lesson_One
//
//  Created by Oluwayomi M on 2023-03-31.
//

import SwiftUI

struct CountryView: View {
    @StateObject var apiService = APIService()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(apiService.countries) { country in
                    NavigationLink(destination: CountryDetailView(country: country)) {
                        HStack {
                            Text(countryCodeToFlagEmoji(countryCode: country.code))
                                .font(.system(size: 40))
                            Text(country.name)
                        }
                    }
                    .onAppear {
                        if apiService.countries.last == country {
                            apiService.fetchCountries(offset: apiService.countries.count)
                        }
                    }
                }
            }
            .navigationTitle("Countries")
            .onAppear {
                apiService.fetchCountries()
            }
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
    }
}
