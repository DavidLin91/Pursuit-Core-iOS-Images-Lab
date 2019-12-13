//
//  PokemonDV.swift
//  ImagesLab
//
//  Created by David Lin on 12/10/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class PokemonDVC: UIViewController {

    var pokemon: Cards!
    @IBOutlet weak var pokemonCardImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    @IBOutlet weak var pokemonWeaknessLabel: UILabel!
    @IBOutlet weak var pokemonCell: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        nameLabel.text = pokemon.name
    }

}
