//
//  jSonReader.swift
//  LocalJsonExperiment
//
//  Created by Raman Singh on 2018-06-27.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class JSONReader: NSObject {

    var allCrimesArray = [Crime]()
    func readLocalJsonAndAddCrimes(completion: @escaping ([Crime]?)->(Void)) {
        self.readJSONFile { (json) -> (Void) in
            if let json = json {
                if let allCrimes = json["features"] as! [[String:Any]]? {
                    for i in 0..<allCrimes.count {
                        let crimeDict = allCrimes[i]
                        let crime = Crime(withCrimeDictionary: crimeDict)
                        self.allCrimesArray.append(crime)
                    }
                    
                    DispatchQueue.main.async {
                        completion(self.allCrimesArray)
                        self.allCrimesArray = [Crime]()
                    }
                    
                }
            }
        }
    }
    
    func readJSONFile(completion: @escaping ([String: Any]?)->(Void)) {
        if let path = Bundle.main.path(forResource: "crime_json_all_years", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [String:Any] {
                    DispatchQueue.main.async {
                        completion(jsonResult)
                    }
                }
            } catch {
                
            }
        }
    }
    
}
