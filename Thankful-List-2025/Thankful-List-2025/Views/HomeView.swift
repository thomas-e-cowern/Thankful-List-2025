//
//  HomeView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//
import SwiftUI

struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack(spacing: 30) {
                    
                    Image("Thanks")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    
                    Text("Welcome to the Grateful List!")
                        .font(.title)
                        .padding()
                    
                    Text("The Grateful List exists to help you keep track of people, places, experiences and things that you are grateful for in your life.")
                        .padding()
                }
            }
            .navigationDestination(for: Thanks.self, destination: { thanks in
                EditThanksView(navigationPath: $path, thanks: thanks)
            })
            .ThanksToolbar {
                print("Add tapped")
                let newThanks = Thanks(title: "", body: "", date: Date.now, isFavorite: false, icon: IconImages.star.rawValue, color: "#007AFF")
                modelContext.insert(newThanks)
                path.append(newThanks)
            }
        }
    }
}

#Preview {
    HomeView()
}
