//
//  HomeView.swift
//  RecipeSaverApp
//
//  Created by Oluwayomi M on 2022-09-11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("My Recipe!")
        }.navigationTitle("My Recipe")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
