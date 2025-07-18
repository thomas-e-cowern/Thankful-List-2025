//
//  ThanksView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/17/25.
//

import SwiftUI
import SwiftData

struct ThanksView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var thanks: [Thanks]
    @State var isFavorite: Bool
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Thanks>] = [], isFavorite: Bool) {
        _thanks = Query(filter: #Predicate { thanks in
            if searchString.isEmpty {
                true
            } else {
                thanks.title.localizedStandardContains(searchString)
                || thanks.reason.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
        self.isFavorite = isFavorite
    }
    
    var body: some View {
        List {
            if isFavorite {
                ForEach(thanks) { thank in
                    if thank.isFavorite {
                        NavigationLink(value: thank) {
                            ThanksRowView(thanks: thank)
                        }
                    }
                }
                .onDelete(perform: deleteThanks)
            } else {
                ForEach(thanks) { thank in
                    NavigationLink(value: thank) {
                        ThanksRowView(thanks: thank)
                    }
                }
                .onDelete(perform: deleteThanks)
            }
        }
    }
    
    func deleteThanks(at offsets: IndexSet) {
        for offset in offsets {
            let thanks = thanks[offset]
            modelContext.delete(thanks)
            do {
                try modelContext.save()
            } catch {
                print("Unable to delete thanks: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ThanksView(isFavorite: false)
}
