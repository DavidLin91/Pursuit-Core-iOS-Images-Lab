//
//  PokemonCardsVC.swift
//  ImagesLab
//
//  Created by David Lin on 12/10/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class PokemonCardsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var pokemonCards = [Cards]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        tableView.delegate = self
    }
    
    
    func loadData() {
        _ = PokemonAPI.getData(completion: { (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let pokemonData):
                self.pokemonCards = pokemonData
            }
        })
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pokemonCardsDVC = segue.destination as? PokemonDVC,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("Could not retrieve indexPath of PokemonDVC")
        }
        let pokemon = pokemonCards[indexPath.row]
        pokemonCardsDVC.pokemon = pokemon
    }
}
extension PokemonCardsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonCards.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokemonCell else {
            fatalError("Couldn't dequeue a PokemonCell")
        }
            let pokemonCard = pokemonCards[indexPath.row]
            cell.configureCell(data: pokemonCard)
            return cell
        }
    }

extension PokemonCardsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}
