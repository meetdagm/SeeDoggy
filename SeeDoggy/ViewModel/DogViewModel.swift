//
//  DogViewModel.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/18/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import UIKit


class DogViewModel {
    
    private var dog: Dog
    
    init(dog: Dog) {
        self.dog = dog
    }
    
    var imageURL: URL {
        return dog.imageURL!
    }
}
