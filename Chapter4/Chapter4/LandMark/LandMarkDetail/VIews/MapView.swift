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
        
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    enum Zoom: String, CaseIterable, Identifiable {
         case near = "Near"
         case medium = "Medium"
         case far = "Far"


         var id: Zoom {
             return self
         }
     }
    
    var delta: CLLocationDegrees {
           switch zoom {
           case .near: return 0.02
           case .medium: return 0.2
           case .far: return 2
           }
       }
    
    
    var body: some View {                
        Map(coordinateRegion: .constant(region))
    }
    

    
    var region : MKCoordinateRegion{
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinate = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
        MapView(coordinate: coordinate)
    }
}
