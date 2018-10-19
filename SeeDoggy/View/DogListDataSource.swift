//
//  DogListDataSource.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/18/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class DogListDataSource: NSObject, UICollectionViewDataSource {
    
    private let dogBreedVM: DogBreedViewModel
    
    init(breedVM: DogBreedViewModel) {
        self.dogBreedVM = breedVM
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogBreedVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogCell.reusableIdentifer, for: indexPath) as? DogCell
        cell?.dogViewModel = dogBreedVM.getDog(at: indexPath)
        
        return cell!
    }
}



