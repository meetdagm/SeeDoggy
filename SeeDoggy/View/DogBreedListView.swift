//
//  ListView.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/17/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class DogBreedListView: CustomGenericView {
    
    var dogBreedListViewModel: DogBreedCollectionViewModel? {
        didSet {
            dogBreedListViewModel?.delegate = self
        }
    }
    
    let listCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 10, left: 1.5, bottom: 10, right: 1.5)
        cv.backgroundColor = kAppLightGrayColor
        cv.register(DogBreedListCell.self, forCellWithReuseIdentifier: DogBreedListCell.reusableIdentifer)
        
        return cv
    }()
    
    
    //Set up the constraints in his view
    override func setupView() {
        
        addSubview(listCV)
        
        //Collection View Constraints
        listCV.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        listCV.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        listCV.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        listCV.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
}

extension DogBreedListView: BreedCollectionViewModelDelegate {
    func updateView() {
        listCV.reloadData()
    }
}
