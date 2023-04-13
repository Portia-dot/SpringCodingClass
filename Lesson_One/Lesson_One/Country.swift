//
//  Country.swift
//  Lesson_One
//
//  Created by Oluwayomi M on 2023-03-31.
//

import Foundation

struct CountryResponse: Codable {
    let data: [CountryData]
}

struct CountryData: Codable, Identifiable, Equatable {
    let id: String
    let code: String
    let currencyCodes: [String]
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "wikiDataId"
        case code
        case currencyCodes
        case name
    }
}

