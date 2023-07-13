//
//  MapView.swift
//  Chapter1
//
//  Created by 한현규 on 2023/07/13.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    /**
     *  You use the @State attribute to establish a source of truth for data in your app that you can modify from more than one view. SwiftUI manages the underlying storage and automatically updates views that depend on the value.
     *
     */
    
    var coordinate : CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear{
                region = MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                )
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinate = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
        MapView(coordinate: coordinate)
    }
}
