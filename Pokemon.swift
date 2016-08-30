//
//  Pokemon.swift
//  Pokedex
//
//  Created by Austin Blaser on 8/30/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation

struct Pokemon {
    
    private let kName = "name"
    private let kId = "id"
    private let kAbility = "abilities"
    
    let name: String
    let id: Int
    let abilities: [String]

}

extension Pokemon {
    
    init?(dictionary: [String: AnyObject]){
        guard let name = dictionary["name"] as? String,
         id = dictionary["id"] as? Int,
        abilitiesArray = dictionary["abilities"] as? [[String: AnyObject]] else {return nil}
        
        let abilityDictionaries = abilitiesArray.flatMap({ $0["ability"] as? [String: AnyObject] })
        let abilities = abilityDictionaries.flatMap({$0["name"] as? String})
        
//        self.name = name
//        self.id = id
//        self.abilities = abilities
        
        self.init(name: name, id: id, abilities: abilities)
            
            
            //abilities.reduce("", combine: { $0 + " " + $1
       // })
        
    }
    
}
