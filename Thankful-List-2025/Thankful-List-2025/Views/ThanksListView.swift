//
//  ThanksListView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI

struct ThanksListView: View {
    var body: some View {
        NavigationStack {
            Text("Thanks List")
                .ThanksToolbar {
                    print("Add tapped")
                }
        }
    }
}

#Preview {
    ThanksListView()
}
