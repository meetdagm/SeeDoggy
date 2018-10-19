//
//  Networking.swift
//  SeeDoggy
//
//  Created by Dagmawi Nadew-Assefa on 10/18/18.
//  Copyright © 2018 Sason. All rights reserved.
//

import Alamofire


class Networking {
    
    // Setup Singleton instance
    private static let instance = Networking()
    private init() { }
    static var sharedInstance: Networking {
        return instance
    }
    
    func fetch(with requestUrl: URL, completion: @escaping([String])->()) {
        
        // Make Network Request on background Thread
        DispatchQueue.global(qos: .background).async {
            
            Alamofire.request(requestUrl).responseJSON { (response) in
                
                // Read JSON can't use decodable as the request response is not properly formatted.
                guard let json = response.result.value as? [String:Any], let allBreedsDict = json[DoggieAPI.messageKey] as? [String: Any] else { fatalError() }
                
                //Get back on the main thread
                DispatchQueue.main.async {
                    // Map Dictionary Keys into array of strings and run the completion block.
                    completion( allBreedsDict.keys.map({ $0 }) )
                }
            }
        }
    }
    
    func fetchDog(with requestURL: URL, completion: @escaping([String]) -> ()){
        
        // Make Network Request on background Thread
        DispatchQueue.global(qos: .background).async {
            
            Alamofire.request(requestURL).responseJSON { (response) in
                
                // Read JSON can't use decodable as the request response is not properly formatted.
                guard let json = response.result.value as? [String:Any], let dogs = json[DoggieAPI.messageKey] as? [String] else {fatalError()}
                
                // Get back on the main Thread
                DispatchQueue.main.async {
                    completion(dogs)
                }
            }
        }
    }
}
