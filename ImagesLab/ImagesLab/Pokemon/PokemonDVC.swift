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
        nameLabel.text = "Name: \(pokemon.name ?? "none" )"
        pokemonWeaknessLabel.text = "Weakness: \(pokemon.weakness?.type ?? "none")"
        pokemonCell.text = "Set: \(pokemon.set ?? "unknown")"
        for types in pokemon.types ?? ["none"] {
            pokemonTypeLabel.text = "Type(s): \(types.description)"
        }
        NetworkHelper.shared.performDataTask(with: pokemon.imageUrl) { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let data):
                DispatchQueue.main.async {
                    let pokemonImage = UIImage(data: data)
                    self.pokemonCardImage.image = pokemonImage
                }
            }
        }
    }

}
