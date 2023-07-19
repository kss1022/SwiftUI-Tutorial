//
//  CategoryHome.swift
//  Chapter3
//
//  Created by 한현규 on 2023/07/19.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData : ModelData
    
    var body: some View {
        NavigationView {
            
            VStack{
         
                List{
                    modelData.features[0].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200.0)
                        .clipped()
                                                                                        
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
