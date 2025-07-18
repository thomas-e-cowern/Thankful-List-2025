//
//  ContentView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sortOrder = SortDescriptor(\Thanks.title)
    
    var body: some View {
        VStack {
            TabView {
                Tab("Home", systemImage: "house") {
                    HomeView()
                }
                Tab("Thanks List", systemImage: "list.bullet") {
                    ThanksListView(sort: sortOrder)
                }
                Tab("Favorites", systemImage: "heart") {
                    FavoritesView(sort: sortOrder)
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

