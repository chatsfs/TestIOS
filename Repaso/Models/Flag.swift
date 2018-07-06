//
//  Flag.swift
//  Repaso
//
//  Created by Erick Carrasco on 7/4/18.
//  Copyright © 2018 Erick Carrasco. All rights reserved.
//

import Foundation
import SwiftyJSON

class Flag {
    var name: String
    var flagImage: String
    var code: String
    var region: String
    var subregion: String
    var population: String
    
    init(name: String, flagImage: String,code: String, region: String, subregion: String, population: String) {
        self.name = name
        self.flagImage = flagImage
        self.code = code
        self.region = region
        self.subregion = subregion
        self.population = population
    }
    
    convenience init(name: String, flagImage: String){
        self.init(name: name, flagImage: flagImage, code: "", region: "", subregion: "", population: "")
    }
    
    convenience init (from json: JSON){
        self.init(name: json["name"].stringValue,
                  flagImage: json["flag"].stringValue,
                  code: json["alpha3Code"].stringValue,
                  region: json["region"].stringValue,
                  subregion: json["subregion"].stringValue,
                  population: json["population"].stringValue)
    }
    
    class func buildAll(from jsonFLags: [JSON]) -> [Flag] {
        
        let count = jsonFLags.count
        var flags: [Flag] = []
        for i in 0 ..< count {
            flags.append(Flag(from: JSON(jsonFLags[i])))
        }
        return flags
    }
}
