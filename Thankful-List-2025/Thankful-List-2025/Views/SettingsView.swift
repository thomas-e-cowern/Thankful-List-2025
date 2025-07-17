//
//  SettingsView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var thanks: [Thanks]
    @State private var showAlert: Bool = false
    @State private var showingExporter = false
    
    var body: some View {
        NavigationStack {
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
                    
//                    HStack(spacing: 30) {
//                        Text("Export all data?")
//                        Button() {
//                            showingExporter.toggle()
//                        } label: {
//                            Text("Export data")
//                        }
//                        .buttonStyle(.borderedProminent)
//                    }
//                    .sheet(isPresented: $showingExporter) {
//                        ThanksExportView(thanks: thanks)
//                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .alert("Delete all data?  This is irreversible.", isPresented: $showAlert) {
                Button {
                    deleteAllData()
                } label: {
                    Text("Delete all data!")
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
