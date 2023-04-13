//
//  NewRecipe.swift
//  RecipeSaverApp
//
//  Created by Oluwayomi M on 2022-09-11.
//

import SwiftUI

struct NewRecipe: View {
    var body: some View {
        NavigationView {
            Text("New Recipe")
        }.navigationTitle("New Recipe")
    }
}

struct NewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipe()
    }
}
