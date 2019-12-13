//
//  PokemonCell.swift
//  ImagesLab
//
//  Created by David Lin on 12/10/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

// uploads image
class PokemonCell: UITableViewCell {
    @IBOutlet weak var pokemonCardImage: UIImageView!
    
    var pokemon: Cards!
    
    func configureCell(data: Cards) {
        NetworkHelper.shared.performDataTask(with: data.imageUrl) { (result) in
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
