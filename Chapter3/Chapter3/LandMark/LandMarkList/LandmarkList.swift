//
//  LandmarkList.swift
//  Chapter1
//
//  Created by 한현규 on 2023/07/13.
//

import SwiftUI

struct LandmarkList: View {
            
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true
    


    var filteredList : [LandMark]{
        modelData.landMarks.filter { landMark in
            !showFavoritesOnly || landMark.isFavorite
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show Favorites Only❤️")
                }
                
                                
                ForEach(filteredList) { landMark in
                    NavigationLink {
                        LandMarkDetailView(landMark: landMark)
                    } label: {
                        LandmarkRow(landmark: landMark)
                    }
                }
            }
            .navigationTitle("LandMarkList")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
                 LandmarkList()
                     .previewDevice(PreviewDevice(rawValue: deviceName))
                     .previewDisplayName(deviceName)
                     .environmentObject(ModelData())
             }
    }
}
