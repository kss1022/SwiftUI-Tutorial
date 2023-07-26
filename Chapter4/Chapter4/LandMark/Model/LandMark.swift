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
    var isFavorite : Bool
    var isFeatured: Bool

    var category : Category
    enum Category : String , CaseIterable , Codable{
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName : String
    var image : Image{
        Image(imageName)
    }

    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
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

