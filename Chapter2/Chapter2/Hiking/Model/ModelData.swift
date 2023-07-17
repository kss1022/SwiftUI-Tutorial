//
//  ModelData.swift
//  Chapter2
//
//  Created by 한현규 on 2023/07/18.
//

import Foundation



final class ModelData{
    
    
    var hikes : [Hike] = load("hikeData.json")
}



func load<T : Decodable>(_ fileName : String) -> T{
    
    
    let data : Data
    
    guard let url =  Bundle.main.url(forResource: fileName, withExtension: nil)else{
        fatalError("Couldn't find \(fileName) in main bundle.")

    }
    
    do{
        data = try Data(contentsOf: url)
    }catch{
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
        
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
    
    
}
