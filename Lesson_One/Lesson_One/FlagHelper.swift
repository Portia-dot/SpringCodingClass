//
//  FlagHelper.swift
//  Lesson_One
//
//  Created by Oluwayomi M on 2023-03-31.
//

import Foundation


func countryCodeToFlagEmoji(countryCode: String) -> String {
    var flagString = ""
    let base : UInt32 = 127397
    for scalar in countryCode.unicodeScalars {
        if let scalarValue = UnicodeScalar(base + scalar.value) {
            flagString.append(String(scalarValue))
        }
    }
    return flagString
}
