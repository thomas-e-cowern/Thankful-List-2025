//
//  EditThanksView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI

struct EditThanksView: View {
    
    @Environment(\.modelContext) var modelContext
    @Binding var navigationPath: NavigationPath
    
    var thanks: Thanks
    
    var body: some View {
        
        @Bindable var thanks = thanks
        
        Form {
            Section {
                TextField("What are you thankful for?", text: $thanks.title)
                
                TextField("Why are you thankful for this?", text: $thanks.reason)
                
                HStack {
                    Text("Mark as favorite")
                    
                    Spacer()
                    
                    Button {
                        thanks.isFavorite.toggle()
                    } label: {
                        thanks.isFavorite ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                        
                    }
                    .foregroundStyle(.red)
                }
                
            }
        }
        .onDisappear {
            if thanks.title.isEmpty {
                modelContext.delete(thanks)
            } else {
                do {
                    try modelContext.save()
                } catch {
                    print("Unable to save context: \(error)")
                }
                
            }
            
        }
    }
}

#Preview {
    EditThanksView( navigationPath: .constant(NavigationPath()), thanks: Thanks.sampleThanks[0])
}
