//
//  Pokemon.swift
//  ImagesLab
//
//  Created by David Lin on 12/10/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//


// hi-res image, name, type, weakness, set

import Foundation

struct PokemonCards: Codable {
    let cards: [Cards]
}
    

struct Cards: Codable {
    let name: String?
    let imageUrl: String
    let imageUrlHiRes: String
    let types: [String]?
    let weakness: Weakness?
    var set: String?
}

struct Weakness: Codable {
    let type: String?
    let value: String
}
