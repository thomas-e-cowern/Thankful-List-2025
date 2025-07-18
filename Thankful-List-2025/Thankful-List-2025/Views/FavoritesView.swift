//
//  FavoritesView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var path = NavigationPath()
    @Query var thanks: [Thanks]
    @State private var searchText = ""
    @State private var sortOrder = [SortDescriptor(\Thanks.title)]
    
    init(sort: SortDescriptor<Thanks>) {
        _thanks = Query(sort: [sort])
    }
    
    var body: some View {
        NavigationStack {
            Text("Favorites View")
                .ThanksToolbar {
                    print("Add tapped")
                }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name A->Z")
                            .tag([SortDescriptor(\Thanks.title)])
                        
                        Text("Name Z->A")
                            .tag([SortDescriptor(\Thanks.title, order: .reverse)])
                        
                        Text("Date 1->30")
                            .tag([SortDescriptor(\Thanks.date)])
                        
                        Text("Date 30->1")
                            .tag([SortDescriptor(\Thanks.date, order: .reverse)])
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "plus")
                    .onTapGesture {
                        let newThanks = Thanks(title: "", body: "", date: Date.now, isFavorite: false, icon: IconImages.star.rawValue, color: "#007AFF")
                        modelContext.insert(newThanks)
                        path.append(newThanks)
                    }
            }
        }
    }
}

#Preview {
    FavoritesView(sort: SortDescriptor(\Thanks.title))
}
