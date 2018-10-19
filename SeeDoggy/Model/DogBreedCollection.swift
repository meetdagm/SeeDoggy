//
//  DogBreedCollection.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/17/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import Foundation

protocol BreedCollectionDelegate: class {
    func breedAddedToColleciton()
}

class DogBreedCollection {
    
    private var dogBreeds_ = [DogBreed]()
    weak var delegate: BreedCollectionDelegate?
    
    
    init() {
        fetchBreed()
    }
    
    var amountOfDogBreed: Int {
        return dogBreeds_.count
    }
    
    func fetchBreed() {
        
        // TODO: Make networking request with store to fetch dog data
        guard let requestURL = URL(string: DoggieAPI.allBreedsNamePath) else { return }
        Networking.sharedInstance.fetch(with: requestURL){ [weak self] (allBreeds) in
            self?.dogBreeds_ = allBreeds.map({ return DogBreed(breedName: $0) })
            self?.delegate?.breedAddedToColleciton()
        }
    }
    
    func getBreed(at index: IndexPath) -> DogBreed? {
        guard index.row < amountOfDogBreed else { return nil }
        return dogBreeds_[index.row]
    }
    
}
