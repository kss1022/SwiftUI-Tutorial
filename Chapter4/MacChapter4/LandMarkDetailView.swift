//
//  LandMarkDetailView.swift
//  MacChapter4
//
//  Created by 한현규 on 2023/07/26.
//

import SwiftUI
import MapKit

struct LandMarkDetailView: View {
    @EnvironmentObject var modelData : ModelData
    var landMark : LandMark
    
    var landmarkIndex: Int{
        modelData.landMarks.firstIndex {
            $0.id == landMark.id
        }!
    }
    
    var body: some View {
        ScrollView(.vertical) {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: landMark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landMark.locationCoordinate))
                    destination.name = landMark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landMark.image)
                        .offset(y: -130)
                        .padding(.bottom, -130)
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landMark.name)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.landMarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text(landMark.park)
                            Text(landMark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                
                
                Divider()
                
                
                Text("About \(landMark.name)")
                    .font(.title2)
                Text(landMark.description)
            }
            .padding()
            .offset(y: -50)
        }
        .navigationTitle(landMark.name)
    }
    
    
    
}

struct LandMarkDetailView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandMarkDetailView(landMark: modelData.landMarks[0])
            .environmentObject(modelData)
            .frame(width: 850, height: 700)
        
    }
}
