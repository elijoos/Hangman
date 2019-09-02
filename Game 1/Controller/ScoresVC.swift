//
//  ScoresVC.swift
//  Game 1
//
//  Created by COMPUTER on 1/25/18.
//  Copyright © 2018 COMPUTER. All rights reserved.
//

import UIKit
import CoreData

class ScoresVC: UIViewController { 

   
    @IBOutlet weak var totalTrophiesLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let highscore = defaults.value(forKey: "totalTrophies") {
            totalTrophiesLbl.text = "\(highscore)"
        } else {
            // no highscore exists
            print("highscore does not exist")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



