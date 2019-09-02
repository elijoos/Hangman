//
//  PopUpViewController.swift
//  Game 1
//
//  Created by COMPUTER on 12/11/17.
//  Copyright © 2017 COMPUTER. All rights reserved.
//

import UIKit

 var playGameVC = PlayGameVC!.self

class PopUpViewController: UIViewController {
   

    @IBOutlet weak var winOrLoseLabel: UILabel!
    
    @IBOutlet weak var popupSecretReveal: UILabel!
    
    @IBOutlet weak var trophiesAdded: UILabel!
    
    @IBOutlet weak var nextLevelBtn: RoundedButton!
    
    @IBOutlet weak var homeBtn: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnHomeButton(_ sender: Any) {
        performSegue(withIdentifier: "SelectLevelVCFromPopup", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextLevelSegue" {
            let level = Level()
            if levelTitleLabelGlobal == "Beginner" {
                level.beginnerMode()
            } else if levelTitleLabelGlobal == "Intermediate" {
                level.intermediateMode()
            } else {
                level.advancedMode()
            }
        }
    }
    
    @IBAction func nextLevelBtn(_ sender: Any) {
        //use segue
        performSegue(withIdentifier: "NextLevelSegue", sender: self)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
