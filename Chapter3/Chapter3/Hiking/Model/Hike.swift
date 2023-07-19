//
//  Hike.swift
//  Chapter2
//
//  Created by 한현규 on 2023/07/18.
//

import Foundation



struct Hike : Decodable , Hashable , Identifiable{

    
    let id : Int
    let name : String
    let distance : Double
    let difficulty : Int
    let observations : [Observation]
    
    static var formatter = LengthFormatter()
    
    var distanceText : String{
        Hike.formatter.string(
            fromValue: distance, unit: .kilometer)
    }
    
    
    struct Observation : Decodable, Hashable{
        let distanceFromStart : Double
        
        let elevation : Range<Double>
        let pace : Range<Double>
        let heartRate : Range<Double>
    }
    
}
