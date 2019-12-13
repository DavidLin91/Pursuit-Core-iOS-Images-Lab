//
//  ComicsAPI.swift
//  ImagesLab
//
//  Created by David Lin on 12/10/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct ComicsAPI {
    
    // get data/ captures it bur not in use
   static func getImage(with comicNum: Int, completion: @escaping (Result<Comics, AppError>) -> ()) {
        
        let comicURL = "https://xkcd.com/\(comicNum)/info.0.json"
        
        NetworkHelper.shared.performDataTask(with: comicURL ) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let comicSearch = try JSONDecoder().decode(Comics.self, from: data)
                    let comics = comicSearch
                    completion(.success(comics))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}


