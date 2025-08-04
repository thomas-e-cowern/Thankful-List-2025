//
//  SettingsView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI
import SwiftData
import TipKit

struct SettingsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var path = NavigationPath()
    @Query var thanks: [Thanks]
    @State private var showAlert: Bool = false
    @State private var showingExporter = false
    
    let addThanksTip = AddThanksTip()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 30) {
                Section("Data") {
                    VStack(spacing: 20) {
                        Text("The button below will erase all your data and start fresh.")
                        
                        VStack {
                            Text("Caution:")
                                .font(.title2)
                            Text("This will erase all your data and is irreversible")
                        }
                        .foregroundStyle(.red).bold()
                        
                        
                        HStack(spacing: 30) {
                            Text("Erase all data?")
                            Button(role: .destructive) {
                                showAlert.toggle()
                            } label: {
                                Text("Erase data")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    
                    Divider()
                        .foregroundStyle(.red)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Settings")
            .navigationDestination(for: Thanks.self, destination: { thanks in
                EditThanksView(navigationPath: $path, thanks: thanks)
            })
            .alert("Delete all data?  This is irreversible.", isPresented: $showAlert) {
                Button {
                    deleteAllData()
                } label: {
                    Text("Delete all data!")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "plus")
                        .onTapGesture {
                            let newThanks = Thanks(title: "", body: "", date: Date.now, isFavorite: false, icon: IconImages.star.rawValue, color: "#007AFF")
                            modelContext.insert(newThanks)
                            path.append(newThanks)
                        }
                        .popoverTip(addThanksTip)
                }
            }
        }
    }
    
    func deleteAllData() {
        do {
            try modelContext.delete(model:Thanks.self)
        } catch {
            fatalError("Error deleting data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SettingsView()
}
