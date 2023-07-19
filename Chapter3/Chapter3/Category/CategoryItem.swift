//
//  CategoryItem.swift
//  Chapter3
//
//  Created by 한현규 on 2023/07/19.
//

import SwiftUI

struct CategoryItem: View {
    
    let landMark : LandMark
    
    var body: some View {
        VStack(alignment: .leading) {
            landMark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
            Text(landMark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
        
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks = ModelData().landMarks
        CategoryItem(landMark: landmarks[0])
    }
}
