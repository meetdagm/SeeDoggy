//
//  DogBreedCollectionViewModel.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/18/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

protocol BreedCollectionViewModelDelegate: class {
    func updateView()
}

class DogBreedCollectionViewModel {
    
    private var breedCollection: DogBreedCollection
    weak var delegate:BreedCollectionViewModelDelegate?
    
    init(collection: DogBreedCollection) {
        self.breedCollection = collection
        self.breedCollection.delegate = self
    }
    
    var amountOfBreeds: Int {
        return breedCollection.amountOfDogBreed
    }
    
    func getBreed(at index: IndexPath) -> DogBreedViewModel? {
        guard index.row < amountOfBreeds,
            let breed = self.breedCollection.getBreed(at: index) else { return nil}
        return DogBreedViewModel(breed: breed)
    }
    
}

extension DogBreedCollectionViewModel: BreedCollectionDelegate {
    func breedAddedToColleciton() {
        delegate?.updateView()
    }
}
