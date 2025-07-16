//
//  FavoritesView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            Text("Favorites View")
                .ThanksToolbar {
                    print("Add tapped")
                }
        }
    }
}

#Preview {
    FavoritesView()
}
