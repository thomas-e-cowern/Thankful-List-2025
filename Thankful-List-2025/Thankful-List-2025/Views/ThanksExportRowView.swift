//
//  ThanksExportRowView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/17/25.
//

import SwiftUI

struct ThanksExportRowView: View {
    
    var thanks: Thanks
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("I'm thankful for...")
            Text(thanks.title)
                .font(.title)
                .fontWeight(.bold)
            Text("Because...")
            Text(thanks.reason)
                .font(.title)
                .fontWeight(.bold)
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ThanksExportRowView(thanks: Thanks.sampleThanks[3])
}
