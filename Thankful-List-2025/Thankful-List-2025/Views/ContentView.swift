//
//  ContentView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                Tab("Home", systemImage: "house") {
                    HomeView()
                }
                Tab("Thanks List", systemImage: "list.bullet") {
                    ThanksListView()
                }
                Tab("Favorites", systemImage: "heart") {
                    FavoritesView()
                }
                Tab("Settings", systemImage: "gear") {
                    SettingsView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
