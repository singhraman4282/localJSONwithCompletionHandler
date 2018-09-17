//
//  Crime.swift
//  LocalJsonExperiment
//
//  Created by Raman Singh on 2018-06-27.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class Crime: NSObject {
    
    var crimeType:String!
    var crimeLattitude:Double!
    var crimeLongitude:Double!
    var crimeYear:Int!
    var crimeMonth:Int!
    var crimeDay:Int!
    var crimeHour:Int!
    var crimeMinute:Int!
    var crimeIntersection:String!
    var crimeNeighborhood:String!
    
    private let utmManager = UTMManager()
    
    init(withCrimeDictionary crimeDict:[String:Any]) {
        if let geometry = crimeDict["geometry"] as! [String:Any]? {
            if let coordinates = geometry["coordinates"] as! [Double]? {
                
                let latLongDict = utmManager.convertUTMtoLatLong(northing: coordinates[1], easting: coordinates[0])
                crimeLattitude = latLongDict["Lattitude"]!
                crimeLongitude = latLongDict["Longitude"]!
            }
        }
        
        if let properties = crimeDict["properties"] as! [String:Any]? {
            self.crimeType = properties["TYPE"] as! String
            self.crimeYear = properties["YEAR"] as! Int
            self.crimeMonth = Int(properties["MONTH"] as! String)!
            self.crimeDay = Int(properties["DAY"] as! String)!
            self.crimeHour = Int(properties["HOUR"] as! String)!
            self.crimeMinute = Int(properties["MINUTE"] as! String)!
            
            if let intersection = properties["HUNDRED_BLOCK"] as? String {
            self.crimeIntersection = intersection
            } else {
            self.crimeIntersection = "nil"
            }
            
            
            if let neighborhood = properties["NEIGHBOURHOOD"] as? String {
            self.crimeNeighborhood = neighborhood
            } else {
            self.crimeNeighborhood = "nil"
            }
            
            
            
            
        }
        
        
    }
    
}
