//
//  LandMark.swift
//  Chapter1
//
//  Created by 한현규 on 2023/07/13.
//

import Foundation
import SwiftUI
import CoreLocation



struct LandMark : Hashable , Codable , Identifiable{
    var id : Int
    var name : String
    var park : String
    var state : String
    var description : String

    private var imageName : String
    var image : Image{
        Image(imageName)
    }


    private var coordinates : Coordinates
    var locationCoordinate : CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }

    struct Coordinates : Hashable, Codable{
        var longitude : Double
        var latitude : Double
    }

}

