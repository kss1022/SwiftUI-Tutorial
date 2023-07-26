//
//  CategoryHome.swift
//  Chapter3
//
//  Created by 한현규 on 2023/07/19.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData : ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            VStack{
                List{
               
                    PageView(pages: modelData.features.map{ FeatureCard(landmark: $0)})
                        .aspectRatio(3 / 2, contentMode: .fit)
                        .listRowInsets(EdgeInsets())
                    
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(
                            categoryName: key,
                            items: modelData.categories[key]!
                        )
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
                
                .navigationTitle("Featured")
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.circle")
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(modelData)
                }
                
            }
            
            
            
            
            
        }
        
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
