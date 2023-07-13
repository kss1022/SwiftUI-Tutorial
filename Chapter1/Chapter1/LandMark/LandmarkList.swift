//
//  LandmarkList.swift
//  Chapter1
//
//  Created by 한현규 on 2023/07/13.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List{
                ForEach(landmarks) { landMark in
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

             }
    }
}
