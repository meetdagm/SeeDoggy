//
//  DogBreedListDataSource.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/17/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class DogBreedListDataSource: NSObject, UICollectionViewDataSource {
    
    private let collectionView: UICollectionView
    private let dogBreedCollectionVM: DogBreedCollectionViewModel
    
    init(breedCollection: DogBreedCollectionViewModel, collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.dogBreedCollectionVM = breedCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogBreedCollectionVM.amountOfBreeds
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogBreedListCell.reusableIdentifer, for: indexPath) as? DogBreedListCell
        cell?.breedViewModel = dogBreedCollectionVM.getBreed(at: indexPath)
        return cell!
    }
}
