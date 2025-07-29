//
//  Previewer.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/29/25.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    let container: ModelContainer
    let thanks: Thanks
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Thanks.self, configurations: config)
        
        thanks = Thanks(title: "My friends and family", body: "They are the ones who make life worth living", date: Date.now, isFavorite: true, icon: "star", color: "#007AFF")
    }
}
