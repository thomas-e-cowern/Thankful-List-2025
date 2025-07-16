//
//  SettingsView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Text("Settings View")
                .ThanksToolbar {
                    print("Add tapped")
                }
        }
    }
}

#Preview {
    SettingsView()
}
