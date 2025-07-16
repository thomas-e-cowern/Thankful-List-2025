//
//  ThanksListView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI
import SwiftData

struct ThanksListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var path = NavigationPath()
    @Query var thanks: [Thanks]
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(thanks) { thank in
                    Text(thank.title)
                }
            }
            .navigationDestination(for: Thanks.self, destination: { thanks in
                EditThanksView(navigationPath: $path, thanks: thanks)
            })
            .ThanksToolbar {
                print("Add tapped")
                let newThanks = Thanks(title: "", body: "", date: Date.now, isFavorite: false, icon: IconImages.star.rawValue, color: "#007AFF")
                modelContext.insert(newThanks)
                path.append(newThanks)
            }
        }
    }
}

#Preview {
    ThanksListView()
}
