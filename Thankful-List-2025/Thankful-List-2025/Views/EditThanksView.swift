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
    var selectedColor: Color = .blue
    
    private var colorBinding: Binding<Color> {
            Binding<Color>(
                get: { Color(hex: self.thanks.color) ?? .white }, // Fallback to white if conversion fails
                set: { newValue in
                    self.self.thanks.color = newValue.toHexString() ?? "#FFFFFF" // Fallback to white hex string
                }
            )
        }
    
    var body: some View {
        
        @Bindable var thanks = thanks
        
        Form {
            Section("Basic Information") {
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
            
            Section("How your Icon will look based on selections below") {
                HStack(alignment: .center) {
                    Spacer()
                    Image(systemName: thanks.icon)
                        .foregroundStyle(thanks.hexColor)
                        .font(.title)
                    Spacer()
                }
            }
            
            Section("Icon and Colors") {
                Picker("Choose an Icon", selection: $thanks.icon) {
                    ForEach(IconImages.allCases, id: \.self) { icon in
                        Image(systemName: icon.rawValue)
                            
                            .tag(icon.rawValue)
                    }
                    .foregroundStyle(thanks.hexColor)
                }
                .pickerStyle(.palette)
                
                ColorPicker("Choose a color", selection: colorBinding)
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
