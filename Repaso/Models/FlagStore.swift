//
//  FlagStore.swift
//  Repaso
//
//  Created by Erick Carrasco on 7/4/18.
//  Copyright © 2018 Erick Carrasco. All rights reserved.
//

import Foundation

class FlagStore {
    
    let flag = UserDefaults.standard
    
    var flagStore: Flag? {
        get{
            let name = flag.string(forKey: "flagName")
            let flagImage = flag.string(forKey: "flagImage")
            if name == nil && flagImage == nil {
                return nil
            }
            return Flag(name: name!, flagImage: flagImage!)
        }
        set{
            if let flag = newValue{
                self.flag.set(flag.name, forKey: "flagName")
                self.flag.set(flag.flagImage, forKey: "flagImage")
            }
        }
    }
    
}
