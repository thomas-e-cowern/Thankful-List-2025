//
//  CustomTabBarView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/17/25.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var index: Int
    @State private var showAdd: Bool = false
    @Binding var path: NavigationPath
    @Binding var thanks: Thanks
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.index = 0
                    
                } label: {
                    Image(systemName: self.index == 0 ? "house.fill" :"house")
                        .font(.title2)
                }
//                .foregroundStyle(TLCustomColors.accentsColors.opacity(self.index == 0 ? 1 : 0.2))
                
                Spacer(minLength: 0)
                
                Button {
                    self.index = 1
                } label: {
                    Image(systemName: self.index == 1 ? "list.bullet.clipboard.fill" : "list.bullet.clipboard")
                        .font(.title)
                }
//                .foregroundStyle(TLCustomColors.accentsColors.opacity(self.index == 1 ? 1 : 0.2))
                
                Spacer(minLength: 0)
                
                Button {
                    showAdd.toggle()
                } label: {
                    ZStack {
                        Circle()
//                            .fill(TLCustomColors.accentsColors)
                            .frame(width: 70)
                        Circle()
                            .frame(width: 50)
                        Image(systemName: "plus")
                            .foregroundStyle(Color.white)
                            .font(.largeTitle)
                    }
                }
                .offset(y: -25)
                
                Spacer()
                
                Button {
                    self.index = 2
                } label: {
                    Image(systemName: self.index == 2 ? "heart.fill" :"heart")
                        .font(.title2)
                }
//                .foregroundStyle(TLCustomColors.accentsColors.opacity(self.index == 2 ? 1 : 0.2))
                
                Spacer(minLength: 0)
                
                Button {
                    self.index = 3
                } label: {
                    Image(systemName: self.index == 3 ? "person.fill" :"person")
                        .font(.title2)
                }
//                .tint(TLCustomColors.accentsColors)
//                .foregroundStyle(TLCustomColors.accentsColors.opacity(self.index == 3 ? 1 : 0.2))
                
            }
            .padding(.horizontal, 35)
//            .tint(TLCustomColors.accentsColors)
        }
        .offset(y: -15)
        .sheet(isPresented: $showAdd) {
            EditThanksView(navigationPath: $path, thanks: thanks)
        }
        
    }
}

//
//#Preview {
//    CustomTabBarView()
//}
