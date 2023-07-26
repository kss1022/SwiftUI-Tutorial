//
//  LandMarkDetailView.swift
//  WatchChatper4 Watch App
//
//  Created by 한현규 on 2023/07/26.
//

import SwiftUI

struct LandMarkDetailView: View {
    @EnvironmentObject var modelData : ModelData
    var landMark : LandMark
    
    var landmarkIndex: Int{
        modelData.landMarks.firstIndex {
            $0.id == landMark.id
        }!
    }
    
    var body: some View {
        ScrollView{
            VStack {
                CircleImage(image: landMark.image.resizable())
                    .scaledToFill()
                
                Text(landMark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landMarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landMark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landMark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landMark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16.0)
        }
        .navigationTitle("LandMarks")
    }
        

    
}

struct LandMarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return Group {
            LandMarkDetailView(landMark: modelData.landMarks[0])
                 .environmentObject(modelData)
                 .previewDevice("Apple Watch Series 5 - 44mm")


            LandMarkDetailView(landMark: modelData.landMarks[1])
                 .environmentObject(modelData)
                 .previewDevice("Apple Watch Series 5 - 40mm")
         }
    }
}
