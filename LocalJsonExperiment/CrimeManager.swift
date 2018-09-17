//
//  CrimeManager.swift
//  LocalJsonExperiment
//
//  Created by Raman Singh on 2018-06-27.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class CrimeManager: NSObject {
    let jsonReader = JSONReader()
    var crimes = [Crime]()
    
    var crimeDictionary = [String:Any]()
    
    
    
    
    
    func getCrimeDataFromJson(completion: @escaping ([Crime]?)->(Void)) {
        jsonReader.readLocalJsonAndAddCrimes { (allCrimes) -> (Void) in
            if let allCrimes = allCrimes {
                self.crimes = allCrimes
            }
            
            DispatchQueue.main.async {
                completion(self.crimes)
            }
        }
    }
    
    
    
    
}
