//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Rom Sharony on 30/06/2017.
//  Copyright © 2017 Rom Sharony. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
    }
    
    


}
