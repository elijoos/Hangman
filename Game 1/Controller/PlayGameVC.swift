//
//  ViewController.swift
//  Game 1
//
//  Created by COMPUTER on 11/9/17.
//  Copyright © 2017 COMPUTER. All rights reserved.
//

import UIKit
import Foundation
import CoreData

var secret : String = String()
var levelTitleLabelGlobal : String = String()
var totalTrophyInt : Int = Int()
var customGamePhrase : String = String()
var selectDifficulty = SelectDifficultyVC!.self
class PlayGameVC: UIViewController {

    @IBOutlet weak var problemText: UILabel!
    
    @IBOutlet weak var guessedWrongLettersLabel: UILabel!
    
    @IBOutlet weak var levelTitleLabel: UILabel!
    
    @IBOutlet weak var chancesRemaining: UILabel!
    
    
    var letterGuessedStr: String?
    var outcome = Bool()
    var lettersWrongCounter = 7
    var guessedWrongLettersArray = [String]()
    var level: Level!
    var numbersExcluded = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    let beginnerTrophiesAdd = 10
    let intermediateTrophiesAdd = 20
    let advancedTrophiesAdd = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
     levelTitleLabel.text = "\(levelTitleLabelGlobal)"
        for letter in secret {
                if letter == " "{
                    problemText.text?.append(" ")
                } else {
                    problemText.text?.append("-")
                }
            }
   
        
        }
    
    var guesses: [String] = []
    
    func guess(guessed: String) {
       
        problemText.text = ""
        
        for letter in secret {
            
            if letter == " "{
                        problemText.text?.append(letter)
                    }
                    else if guesses.contains("\(letter)") {
                        problemText.text?.append(letter)
                    }
                    else {
                        problemText.text?.append("-")
                    }
                }
        
    }
    
   
    
    func gameOver(outcome: Bool) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popupViewID") as! PopUpViewController
        self.addChildViewController(popOverVC)  //adding popOverVC to the current VC
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        if outcome == true {
            let defaults = UserDefaults.standard
            
            if levelTitleLabel.text == "Beginner" {
                popOverVC.trophiesAdded.text = "+10"
                let currentDefaultScore = defaults.integer(forKey: "totalTrophies")
                totalTrophyInt = currentDefaultScore
                totalTrophyInt += 10
                defaults.set(totalTrophyInt, forKey: "totalTrophies")
            }
            if levelTitleLabel.text == "Intermediate" {
                popOverVC.trophiesAdded.text = "+20"
                let currentDefaultScore = defaults.integer(forKey: "totalTrophies")
                totalTrophyInt = currentDefaultScore
                totalTrophyInt += 20
                defaults.set(totalTrophyInt, forKey: "totalTrophies")
                
            }
            if levelTitleLabel.text == "Advanced" {
                popOverVC.trophiesAdded.text = "+50"
                let currentDefaultScore = defaults.integer(forKey: "totalTrophies")
                totalTrophyInt = currentDefaultScore
                totalTrophyInt += 50
                defaults.set(totalTrophyInt, forKey: "totalTrophies")
            }
            if levelTitleLabel.text == "Custom Game" {
                print("This is the custom game")
                popOverVC.nextLevelBtn.isHidden = true
              
            }
            popOverVC.winOrLoseLabel.text = "You Win!"
            popOverVC.popupSecretReveal.textColor = UIColor(named: "green")
            
       }
        if outcome == false {
            popOverVC.winOrLoseLabel.text = "You Lose"
            popOverVC.winOrLoseLabel.textColor = UIColor(named: "red")
            popOverVC.trophiesAdded.text = "+0"
            if levelTitleLabel.text == "Custom Game" {
                popOverVC.nextLevelBtn.isHidden = true
                
            }
        }
        popOverVC.popupSecretReveal.text = " \"\(secret)\" "
    }
   
    func guessButton() {
        let guessedLetter = letterGuessedStr
        if guessedLetter!.count == 1 {
            
                if secret.contains("\(guessedLetter!)") == false && guessedWrongLettersArray.contains(guessedLetter!) == false && lettersWrongCounter > 0 && numbersExcluded.contains("\(String(describing: guessedLetter))") == false{
                    guessedWrongLettersLabel.text?.append("\(guessedLetter!)   ")
                    guessedWrongLettersArray.append(guessedLetter!)
                    lettersWrongCounter -= 1
                    chancesRemaining.text = "\(lettersWrongCounter)"
                  
                } else if secret.contains("\(String(describing: guessedLetter))") == false {
                    guesses.append(guessedLetter!)
                    guess(guessed: guessedLetter!)
            }
 
            if lettersWrongCounter == 0 {
                outcome = false
                gameOver(outcome: outcome)
            }
            if problemText.text?.contains("-") == false {
                //Won Game; Popover view
                outcome = true
                print("You Win!")
                //
                gameOver(outcome: outcome)
            }
    }
}
    
    @IBAction func letterGuessed(_ sender: Any) {
        //switch statements for each guessed letter button
        guard let button = sender as? UIButton else{
            return
        }
        func eachLetterButton(letter: String) {
            letterGuessedStr = letter
            if button.isEnabled{
                button.showsTouchWhenHighlighted = true
            }
            guessButton()
            button.backgroundColor = UIColor(named: "grey")
            letterGuessedStr = ""
        }
        
       
        switch button.tag {
        case 1:
            eachLetterButton(letter: "A")
            break
        case 2:
            eachLetterButton(letter: "B")
            break
        case 3:
            eachLetterButton(letter: "C")
            break
        case 4:
            eachLetterButton(letter: "D")
            break
        case 5:
            eachLetterButton(letter: "E")
            break
        case 6:
            eachLetterButton(letter: "F")
            break
        case 7:
           eachLetterButton(letter: "G")
            break
        case 8:
            eachLetterButton(letter: "H")
            break
        case 9:
            eachLetterButton(letter: "I")
            break
        case 10:
            eachLetterButton(letter: "J")
            break
        case 11:
            eachLetterButton(letter: "K")
            break
        case 12:
            eachLetterButton(letter: "L")
            break
        case 13:
           eachLetterButton(letter: "M")
            break
        case 14:
            eachLetterButton(letter: "N")
            break
        case 15:
            eachLetterButton(letter: "O")
            break
        case 16:
            eachLetterButton(letter: "P")
            break
        case 17:
           eachLetterButton(letter: "Q")
            break
        case 18:
           eachLetterButton(letter: "R")
            break
        case 19:
           eachLetterButton(letter: "S")
            break
        case 20:
           eachLetterButton(letter: "T")
            break
        case 21:
          eachLetterButton(letter: "U")
            break
        case 22:
           eachLetterButton(letter: "V")
            break
        case 23:
            eachLetterButton(letter: "W")
            break
        case 24:
           eachLetterButton(letter: "X")
            break
        case 25:
           eachLetterButton(letter: "Y")
            break
        case 26:
          eachLetterButton(letter: "Z")
            break
        default:
            print("Could not identify case for letter buttons")
        
        
        }
        
    }
    
    
    
}
