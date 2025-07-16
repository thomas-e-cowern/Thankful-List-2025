//
//  ThanksToolbar.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI

struct ThanksToolbar: ToolbarContent {
    let onAddTapped: () -> Void

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: onAddTapped) {
                Image(systemName: "plus.circle.fill")
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
