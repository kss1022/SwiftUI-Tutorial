//
//  FeatureCard.swift
//  Chapter3
//
//  Created by 한현규 on 2023/07/25.
//

import SwiftUI

struct FeatureCard: View {
    
    var landmark : LandMark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2,contentMode: .fit)
            
            .overlay{
                TextOverlay(landmark: landmark)
            }
    }
}



struct TextOverlay: View {
    var landmark: LandMark


    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }


    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
