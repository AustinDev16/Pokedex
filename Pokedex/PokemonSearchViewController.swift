//
//  PokemonSearchViewController.swift
//  Pokedex
//
//  Created by Austin Blaser on 8/30/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return}
        self.view.endEditing(true)
        PokemonController.fetchPokemon(searchTerm) { (pokemon) in
            
         dispatch_async(dispatch_get_main_queue(), {
                guard let pokemon = pokemon else {return}
                self.nameLabel.text = pokemon.name.capitalizedString
                self.idLabel.text = "ID: \(pokemon.id)"
                self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joinWithSeparator(", "))"
            })
        }
    }

  

}
