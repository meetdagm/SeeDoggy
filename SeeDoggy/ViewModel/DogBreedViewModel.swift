//
//  DogBreedViewModel.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/18/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

protocol DogBreedViewModelDelegate: class {
    func updateInfo(with viewModel: DogBreedViewModel)
}

class DogBreedViewModel {
    private let dogBreed: DogBreed
    weak var delegate: DogBreedViewModelDelegate?
    
    init(breed: DogBreed) {
        self.dogBreed = breed
        self.dogBreed.delegate = self
    }
    
    var breedName: String {
        return dogBreed.breedName
    }
    
    var amountOfPics: String {
        return "\(dogBreed.amountOfDogs) Photos"
    }
    
    var breedImageURL: URL? {
        return dogBreed.initialDogImageURL
    }
    
    var count: Int {
        return dogBreed.amountOfDogs
    }
    
    func getDog(at index: IndexPath) -> DogViewModel? {
        guard let dog = dogBreed.getDog(at: index) else { return nil }
        return DogViewModel(dog: dog)
    }
}

extension DogBreedViewModel: DogBreedDelegate {
    func fetchedDogInformation() {
        delegate?.updateInfo(with: self)
    }
}
