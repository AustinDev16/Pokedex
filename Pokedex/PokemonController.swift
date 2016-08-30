//
//  PokemonController.swift
//  Pokedex
//
//  Created by Austin Blaser on 8/30/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseURL = "http://pokeapi.co/api/v2/pokemon/"
    
    static func fetchPokemon(searchTerm: String, completion: (pokemon: Pokemon?) -> Void){
        
        guard let searchURL = NSURL(string: baseURL + searchTerm.lowercaseString) else { completion(pokemon: nil); return}
        
        NetworkController.performRequestForURL(searchURL, httpMethod: .Get) {
            (data, error) in
            
            //deal with json
            
            guard let data = data, //responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding),
            let jsonAnyObject = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)),
            let jsonDictionary = jsonAnyObject as? [String: AnyObject] else {
                completion(pokemon: nil); return}
          
            let pokemon = Pokemon(dictionary: jsonDictionary)
            completion(pokemon: pokemon)
        }
        
        
    }
    
}
