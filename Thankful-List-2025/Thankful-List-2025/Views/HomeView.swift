//
//  HomeView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/16/25.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
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
                        .ThanksToolbar {
                            print("Add tapped")
                        }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
