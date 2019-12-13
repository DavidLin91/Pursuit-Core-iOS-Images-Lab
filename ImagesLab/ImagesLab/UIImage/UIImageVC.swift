//
//  ViewController.swift
//  ImagesLab
//
//  Created by David Lin on 12/10/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class UIImageVC: UIViewController {
    
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var imageNumberTextField: UITextField!
    @IBOutlet weak var imageStepper: UIStepper!
    @IBOutlet weak var mostRecentButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    
    var comics = [Comics]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(number: 614)
    }
    
    // calling data and loading it
    func loadData(number: Int) {
        _ = ComicsAPI.getImage(with: number) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let comic):
                DispatchQueue.main.async {
                    self?.imageNumberTextField.text =
                        comic.num.description
                    self?.getImage(urlImage: comic.img)
                }
            }
        }
    }
    
    func getImage(urlImage: String) {
        NetworkHelper.shared.performDataTask(with: urlImage) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let data):
                DispatchQueue.main.async {
                    let comicImage = UIImage(data :data)
                    self?.comicImage.image = comicImage
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

