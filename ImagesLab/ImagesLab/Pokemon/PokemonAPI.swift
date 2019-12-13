//
//  PokemonAPI.swift
//  ImagesLab
//
//  Created by David Lin on 12/10/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct PokemonAPI {
    
    static func getData(completion: @escaping (Result<[Cards], AppError>) -> ()) {
        
        let pokemonURL = "https://api.pokemontcg.io/v1/cards"
        
        NetworkHelper.shared.performDataTask(with: pokemonURL ) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let pokemonSearch = try JSONDecoder().decode(PokemonCards.self, from: data)
                    let pokemon = pokemonSearch.cards
                    completion(.success(pokemon))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

