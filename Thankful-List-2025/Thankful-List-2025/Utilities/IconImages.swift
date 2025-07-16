//
//  IconImages.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import Foundation

enum IconImages: String, CaseIterable, Identifiable {
    case star = "star.fill"
    case swirl = "swirl.circle.righthalf.filled.inverse"
    case circle = "circle.dotted.circle.fill"
    case person = "person.fill"
    case sun = "sun.min.fill"
    var id: Self { self }
}
