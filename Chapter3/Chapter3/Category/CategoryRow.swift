//
//  CategoryRow.swift
//  Chapter3
//
//  Created by 한현규 on 2023/07/19.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName : String
    var items: [LandMark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
                        
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack(alignment: .top, spacing: 0.0) {
                    ForEach(items) { item in
                        NavigationLink {
                            LandMarkDetailView(landMark: item)
                        } label: {
                            CategoryItem(landMark: item)
                        }
                    }
                }
            }
            .frame(height: 185)

        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        
        let landmarks = ModelData().landMarks
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(3))
        )
    }
}
