//
//  LevelSelectViewController.swift
//  Game 1
//
//  Created by COMPUTER on 11/30/17.
//  Copyright © 2017 COMPUTER. All rights reserved.
//

import UIKit
//Home Screen
class SelectDifficultyVC: UIViewController {
    var _level = 0
    var _chancesRemaining: Int!
    var thePhrase: String!
    var level = Level()
   
    @IBOutlet weak var highScoreLbl: UILabel!
    
    
    var beginnerPhrases = ["STATUE OF LIBERTY", "EIFFEL TOWER", "LEANING TOWER OF PIZA", "STARBUCKS", "MOUNT EVEREST", "AMERICAN EAGLE", "AMAZON RIVER", "BIG BEN", "MOUNT RUSHMORE", "NIAGRA FALLS", "SPACE NEEDLE"]
    var intermediatePhrases = ["UNDER THE WEATHER", "ONCE IN A BLUE MOON", "TASTE OF YOUR OWN MEDICINE"]
    var advancedPhrases = ["NEW ZEALAND", "MEDITERRANIAN SEA", "NORTH POLE", "DEVILS ADVOCATE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        highScoreLbl.text = "\( defaults.value(forKey: "totalTrophies") ?? "0")"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func beginnerModeBtn(_ sender: Any) {
        level.beginnerMode()
        secret = level._phrase
        levelTitleLabelGlobal = level.levelTitleLabel
        _chancesRemaining = level.chancesRemaining
    }
    
    
    @IBAction func intermediateModeBtn(_ sender: Any) {
        level.intermediateMode()
        secret = level._phrase
        levelTitleLabelGlobal = level.levelTitleLabel
        _chancesRemaining = level.chancesRemaining
    }
    
    @IBAction func advancedModeBtn(_ sender: Any) {
        level.advancedMode()
        secret = level._phrase
        levelTitleLabelGlobal = level.levelTitleLabel
        _chancesRemaining = level.chancesRemaining
    }
    
    @IBAction func customGameBtn(_ sender: Any) {
    let alertController = UIAlertController(title: "Player 1", message: "Please enter the phrase for your opponent. Must be no more than 20 characters long", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Phrase"
           
        }
   alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
   alertController.addAction(UIAlertAction(title: "Play", style: .default, handler: { (action) in
    //creating our level, setting the text field of the alert to the secret, and creating an alert if the phraseTextField is nil
     let phraseTextField = alertController.textFields![0] as UITextField
    //alert if nil
    if let phrase = phraseTextField.text?.count, phrase > 20 || phrase == 0{
        let alert = UIAlertController(title: "Error", message: "Phrase must be less than 20 characters and at least 1", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.present(alertController, animated: true, completion: nil)
            phraseTextField.text = nil
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion:nil)
    }
    else {
//        //A VALID PHRASE WAS ENTERED, TIME TO PLAY
        customGamePhrase = phraseTextField.text!.uppercased()
        self.level.customGameMode()
        secret = self.level._phrase
        levelTitleLabelGlobal = self.level.levelTitleLabel
        self._chancesRemaining = self.level.chancesRemaining
        self.performSegue(withIdentifier: "customGameSegue", sender: (Any).self)
        
    }
        }))
        
        self.present(alertController, animated: false, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "beginnerSegue" || segue.identifier == "intermediateSegue" || segue.identifier == "advancedSegue" || segue.identifier == "customGameSegue" {
            if let destination = segue.destination as? PlayGameVC{
                if let lev = sender as? Level {
                    destination.level = lev
                    
                }
            }
        }
    
    }

    
}
