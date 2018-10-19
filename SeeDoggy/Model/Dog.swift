//
//  Dog.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/17/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import Foundation

class Dog {
    
    private var imageURL_: URL?
    
    init(imageURL: URL?) {
        self.imageURL_ = imageURL
    }
    
    var imageURL: URL? {
        return self.imageURL_
    }
    
}
