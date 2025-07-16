//
//  Thankful_List_2025App.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI
import SwiftData

@main
struct Thankful_List_2025App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Thanks.self)
        }
    }
}
