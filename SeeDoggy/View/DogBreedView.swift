//
//  DogBreedView.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/18/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class DogBreedView: CustomGenericView {
    
    private let selectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        return button
    }()
    
    let dogBreedCollection: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.register(DogCell.self, forCellWithReuseIdentifier: DogCell.reusableIdentifer)
        
        return cv
        
    }()
    
    
    override func setupView() {
        
        addSubview(selectedImageView)
        addSubview(dogBreedCollection)
        addSubview(dismissButton)
        
        selectedImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        selectedImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        selectedImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        selectedImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        dogBreedCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        dogBreedCollection.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dogBreedCollection.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dogBreedCollection.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/7).isActive = true
        
        dismissButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        dismissButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -18).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}

extension DogBreedView {
    func setImage(with imageURL: URL){
        selectedImageView.sd_setImage(with: imageURL, completed: nil)
    }
}
