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
    @State private var searchText = ""
    @State private var sortOrder = [SortDescriptor(\Thanks.title)]
    
    init(sort: SortDescriptor<Thanks>) {
        _thanks = Query(sort: [sort])
    }
    
    
    var body: some View {
        NavigationStack(path: $path) {
            ThanksView(searchString: searchText, sortOrder: sortOrder)
                .navigationTitle("Thanks List")
                .navigationDestination(for: Thanks.self, destination: { thanks in
                    EditThanksView(navigationPath: $path, thanks: thanks)
                })
                .searchable(text: $searchText)
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
                .overlay {
                    if thanks.isEmpty {
                        ContentUnavailableView("You don't have any thanks yet!", systemImage: "heart", description: Text("Add a thanks to begin the list!"))
                    }
                }
        }
    }
}

#Preview {
    ThanksListView(sort: SortDescriptor(\Thanks.title))
}
