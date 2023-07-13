//
//  ModelData.swift
//  Chapter1
//
//  Created by 한현규 on 2023/07/13.
//

import Foundation

var landmarks : [LandMark] = load(fileName: "landmarkData.json")

func load<T : Decodable>( fileName : String) -> T{
    
    let data : Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else{
        fatalError("Couldn't find \(fileName) in Bundle.main")
    }
    
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't find \(fileName) fronm Bundle.main:\n\(error)")
    }
            
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(fileName) as \(T.self)\n\(error)")
    }

}
