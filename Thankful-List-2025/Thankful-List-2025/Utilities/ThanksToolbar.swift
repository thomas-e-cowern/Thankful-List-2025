//
//  ThanksToolbar.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI
import SwiftData

struct ThanksToolbar: ToolbarContent {
    let onAddTapped: () -> Void
    @State private var sortOrder = SortDescriptor(\Thanks.title)

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: onAddTapped) {
                Image(systemName: "plus.circle.fill")
            }
        }
        ToolbarItem(placement: .navigationBarLeading) {
            Menu("Sort", systemImage: "arrow.up.arrow.down") {
                Picker("Sort", selection: $sortOrder) {
                    Text("Name")
                        .tag(SortDescriptor(\Thanks.title))

                    Text("Date")
                        .tag(SortDescriptor(\Thanks.date, order: .reverse))
                }
                .pickerStyle(.inline)
            }
        }
    }
}

struct ThanksToolbarModifier: ViewModifier {
    let onAddTapped: () -> Void

    func body(content: Content) -> some View {
        content
            .toolbar {
                ThanksToolbar(onAddTapped: onAddTapped)
            }
    }
}

extension View {
    func ThanksToolbar(onAddTapped: @escaping () -> Void) -> some View {
        self.modifier(ThanksToolbarModifier(onAddTapped: onAddTapped))
    }
}
