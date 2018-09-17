//
//  UTMtoLatLong.swift
//  LocalJsonExperiment
//
//  Created by Raman Singh on 2018-06-27.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit
import UTMConversion

class UTMManager: NSObject {

    func convertUTMtoLatLong(northing:Double, easting:Double) -> [String:Double] {
        let utmCoordinate = UTMCoordinate(northing: northing, easting: easting, zone: 10, hemisphere: .northern)
        let coordinate = utmCoordinate.coordinate()
        let location = utmCoordinate.location()
        
//        print(coordinate.latitude)
//        print(coordinate.longitude)
        
        let coordinateDictionary = ["Lattitude":coordinate.latitude, "Longitude":coordinate.longitude]
        
        return coordinateDictionary
        
    }
    
}
