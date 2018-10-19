//
//  DogCell.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/18/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit
import SDWebImage

class DogCell: UICollectionViewCell, Tappable, ReusableView, TapticScrollable {
    
    var dogViewModel: DogViewModel? {
        didSet {
            dogImage.sd_setImage(with: dogViewModel?.imageURL, completed: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let dogImage: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        
        return imageView
    }()
    
    private func configureCell() {
        layer.cornerRadius = 7.0
        layer.borderColor = kAppWhiteColor.cgColor
        layer.borderWidth = 2.0
        layer.masksToBounds = true
    }
    
    private func setupView() {
        
        configureCell()
        
        addSubview(dogImage)
        
        dogImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dogImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dogImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dogImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}
