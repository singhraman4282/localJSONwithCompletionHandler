//
//  ViewController.swift
//  LocalJsonExperiment
//
//  Created by Raman Singh on 2018-06-26.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit
import algorithmia

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let crimeManager = CrimeManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY - 250)
        label.textAlignment = .center
        label.text = "Loading crime database"
        
        self.view.addSubview(label)
        
        crimeManager.getCrimeDataFromJson { (crimeArray) -> (Void) in
            if let crimeArray = crimeArray {
                print("View controller crime array count: \(crimeArray.count)")
                label.removeFromSuperview()
            }
        }
        
        
    }
    
    
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy"
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MM"
        
        let crimeYearString = yearFormatter.string(from: sender.date)
        let crimeMonthString = monthFormatter.string(from: sender.date)
        
        for crimeIndex in 0..<crimeManager.crimes.count {
            if let crime = crimeManager.crimes[crimeIndex] as? Crime {
                if crime.crimeYear == Int(crimeYearString) && crime.crimeMonth == Int(crimeMonthString) {
                    print(crime.crimeType!)
                }
            }
            
        }
        
    }
    
    
    
    
    
    
}//end
