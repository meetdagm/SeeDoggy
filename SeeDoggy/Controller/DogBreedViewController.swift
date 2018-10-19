//
//  DogBreedViewController.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/18/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class DogBreedViewController: UIViewController {
    
    private let breedView = DogBreedView()
    private let breedViewModel: DogBreedViewModel
    private let breedViewDataSource: DogListDataSource
    
    init(breedViewModel: DogBreedViewModel) {
        self.breedViewModel = breedViewModel
        self.breedViewDataSource = DogListDataSource(breedVM: breedViewModel)
        
        super.init(nibName: nil, bundle: nil)
        
        self.breedView.dogBreedCollection.dataSource = self.breedViewDataSource
        self.breedView.dogBreedCollection.delegate = self
        
        self.breedView.setImage(with: breedViewModel.breedImageURL!)
        self.breedView.dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = breedView
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    @objc private func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
}


extension DogBreedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DogCell,
            let selectedDog = breedViewModel.getDog(at: indexPath) else { return }
        cell.animateTap()
        breedView.setImage(with: selectedDog.imageURL)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? DogCell else { return }
        cell.makeTapticFeedback()
    }
}


extension DogBreedViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.frame.size.width/7)), height: collectionView.frame.size.height * 0.9)
    }
    
    // Set the spacing between cells vertically
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
}
