//
//  ViewController.swift
//  Pokedex
//
//  Created by Austin Blaser on 8/30/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        PokemonController.fetchPokemon("pikachu") { (pokemon) in
            dispatch_async(dispatch_get_main_queue(), { 
                print("finished")
                print(pokemon!.name)
                
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

