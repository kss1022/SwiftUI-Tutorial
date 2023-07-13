//
//  LandMarkDetail.swift
//  Chapter1
//
//  Created by 한현규 on 2023/07/13.
//

import SwiftUI

struct LandMarkDetailView: View {
    
    var landMark : LandMark
    
    var body: some View {
        ScrollView{
            VStack {
                
                MapView(coordinate: landMark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300.0)
                
                CircleImage(image: landMark.image)
                    .frame(width: 200 , height: 200)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    Text(landMark.name)
                        .font(.title)
                    
                    
                    HStack {
                        Text(landMark.park)
                        Spacer()
                        Text(landMark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    
                    Divider()
                    
                    Text("About \(landMark.name)")
                        .font(.title2)
                    Text(landMark.description)
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle(landMark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandMarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkDetailView(landMark: landmarks[0])
    }
}
