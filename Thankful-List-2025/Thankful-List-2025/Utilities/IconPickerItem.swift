//
//  IconPickerItem.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/29/25.
//

import SwiftUI

struct IconPickerItem: View {
    
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.largeTitle) // Example of larger font
        }
    }
}

#Preview {
    IconPickerItem(icon: IconImages.swirl.rawValue)
}
