//
//  FavoriteButton.swift
//  Chapter1
//
//  Created by 한현규 on 2023/07/13.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet : Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            //VoiceOver uses it to improve accessibility.
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
        
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
