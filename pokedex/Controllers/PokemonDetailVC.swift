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
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        idLbl.text = "\(pokemon.id)"
        mainImg.image = UIImage(imageLiteralResourceName: "\(pokemon.id)")
        currentEvoImg.image = UIImage(imageLiteralResourceName: "\(pokemon.id)")
        
        pokemon.downloadPokemonDetails {
            // called only after the download completes!
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weigth
        typeLbl.text = pokemon.type
        evoLbl.text = pokemon.nextEvoText
        if pokemon.nextEvoID != 0 {
            nextEvoImg.isHidden = false
            nextEvoImg.image =
                UIImage(imageLiteralResourceName: "\(pokemon.nextEvoID)")
            evoLbl.text = pokemon.nextEvoText
        } else {
            nextEvoImg.isHidden = true
            evoLbl.text = "No Further Evolutions"
        }
        descriptionLbl.text = pokemon.description
        
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
