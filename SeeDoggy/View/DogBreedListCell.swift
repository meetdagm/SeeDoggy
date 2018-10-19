//
//  ListCell.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/17/18.
//  Copyright © 2018 Sason. All rights reserved.
//


import UIKit
import SDWebImage

class DogBreedListCell: UICollectionViewCell, ReusableView, Shadowable, Tappable {
    
    var breedViewModel: DogBreedViewModel? {
        didSet {
            self.dogCategoryLabel.text = breedViewModel?.breedName
            self.numberOfPicsLabel.text = breedViewModel?.amountOfPics
            self.imageView.sd_setImage(with: breedViewModel?.breedImageURL, completed: nil)
            self.breedViewModel?.delegate = self
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UIImageView to display picture of random dog from breed category
    private let imageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    // UILabel to display name of dog breed
    private let dogCategoryLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shepherd"
        label.font = kAppSemiFont
        label.textColor = kAppWhiteColor
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // Label that represents number of pictures for dog breed category
    private let numberOfPicsLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1,234 Photos"
        label.font = kAppRegularFont
        label.textColor = kAppLightGrayColor
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let blurryBackgroundView: UIVisualEffectView = {
       
        let effect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: effect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupView() {
        customizeCell()
        setupConstraints()
    }
    
    private func customizeCell() {
        backgroundColor = kAppMainTextColor
        addShadow()
        layer.masksToBounds = true
        layer.cornerRadius = 3.0
    }
    
    private func setupConstraints() {
        
        // Add UI elements as subview
        addSubview(imageView)
        addSubview(blurryBackgroundView)
        addSubview(dogCategoryLabel)
        addSubview(numberOfPicsLabel)
        
        // Setup Constraint for imageview
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        // Setup Constraint for category name label
        dogCategoryLabel.bottomAnchor.constraint(equalTo: numberOfPicsLabel.topAnchor).isActive = true
        dogCategoryLabel.leftAnchor.constraint(equalTo: numberOfPicsLabel.leftAnchor).isActive = true
        dogCategoryLabel.rightAnchor.constraint(equalTo: numberOfPicsLabel.rightAnchor).isActive = true
        
        // Setup Constraint for number of photos available for category
        numberOfPicsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -9).isActive = true
        numberOfPicsLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 9).isActive = true
        numberOfPicsLabel.rightAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        blurryBackgroundView.topAnchor.constraint(equalTo: dogCategoryLabel.topAnchor, constant: -9).isActive = true
        blurryBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        blurryBackgroundView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        blurryBackgroundView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    
}

extension DogBreedListCell: DogBreedViewModelDelegate {
    func updateInfo(with viewModel: DogBreedViewModel) {
        numberOfPicsLabel.text = viewModel.amountOfPics
        dogCategoryLabel.text = viewModel.breedName
        imageView.sd_setImage(with: viewModel.breedImageURL, completed: nil)
    }
}
