//
//  ViewController.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/17/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit

class DogBreedListViewController: UIViewController {
    
    private let listView = DogBreedListView()
    private let breedCollectionViewModel: DogBreedCollectionViewModel
    private var dogBreedDataSource: DogBreedListDataSource?
    
    init(breedCollection: DogBreedCollection, withTitle title: String = "Doggies 🐶") {
        
        breedCollectionViewModel = DogBreedCollectionViewModel(collection: breedCollection)
        listView.dogBreedListViewModel = breedCollectionViewModel
        
        super.init(nibName: nil, bundle: nil)
        self.title = title
        
        dogBreedDataSource = DogBreedListDataSource(breedCollection: breedCollectionViewModel, collectionView: listView.listCV)
        self.listView.listCV.dataSource = dogBreedDataSource
        self.listView.listCV.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = listView
    }
    
    
}

extension DogBreedListViewController {
    private func presentBreed(with breed: DogBreedViewModel?){
        guard let breedVM = breed else { return }
        let vcToPresent = DogBreedViewController(breedViewModel: breedVM)
        vcToPresent.modalTransitionStyle = .crossDissolve
        present(vcToPresent, animated: true, completion: nil)
    }
}

//MARK: Setup Delegate to be notified when cell has been selected
extension DogBreedListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tappedCell = collectionView.cellForItem(at: indexPath) as? DogBreedListCell else { return }
        tappedCell.animateTap()
        presentBreed(with: breedCollectionViewModel.getBreed(at: indexPath))
        
    }
}

// MARK: Setup Delegate functions for collection view layout.
extension DogBreedListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.frame.size.width/2) - 3), height: collectionView.frame.size.height * 0.3)
    }
    
    // Set the spacing between cells vertically
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    
    // Set the spacing between cells horizontally
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
}
