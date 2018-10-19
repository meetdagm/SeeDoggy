//
//  DogBreed.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/17/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import Foundation

protocol DogBreedDelegate: class {
    func fetchedDogInformation()
}

class DogBreed {
    
    private var dogs = [Dog]()
    private var breedName_: String
    private var breedURL_: URL?
    private var breedImageURL_: URL?
    weak var delegate: DogBreedDelegate?
    
    init(breedName: String) {
        self.breedName_ = breedName
        self.breedURL_ = URL(string: DoggieAPI.breedBaseURL + breedName + DoggieAPI.breedAllImagesBaseURL)
        fetchDogs()
    }
    
    var breedName: String {
        return self.breedName_
    }
    
    var breedURL: URL? {
        return self.breedURL_
    }
    
    var breedImageURL: URL? {
        return breedImageURL_
    }
    
    private func fetchDogs() {
        guard let requestURL = self.breedURL else { fatalError() }
        
        Networking.sharedInstance.fetchDog(with: requestURL) { [weak self] (allDogs) in
            self?.dogs = allDogs.map({return Dog(imageURL: URL(string: $0)) })
            self?.delegate?.fetchedDogInformation();
        }
    }
    
    var amountOfDogs: Int {
        return dogs.count
    }
    
    var initialDogImageURL: URL? {
        get {
            guard amountOfDogs > 0 else { return nil }
            return dogs[0].imageURL
        }
    }
    
    func getDog(at index: IndexPath) -> Dog? {
        guard index.row < amountOfDogs else { return nil }
        return dogs[index.row]
    }
}
