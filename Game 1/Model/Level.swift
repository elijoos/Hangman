//
//  Level.swift
//  Game 1
//
//  Created by COMPUTER on 11/30/17.
//  Copyright © 2017 COMPUTER. All rights reserved.
//

import UIKit

class Level {
    var _phrase: String!
    private var _chancesRemaining: Int!
    private var _levelTitleLabel: String!

    
    var chancesRemaining: Int {
        if _chancesRemaining == nil {
            _chancesRemaining = 0
        }
        return _chancesRemaining
    }
    
    var levelTitleLabel: String{
        if _levelTitleLabel == nil {
            _levelTitleLabel = ""
        }
        return _levelTitleLabel
    }
    
    var beginnerPhrases = ["STATUE OF LIBERTY", "EIFFEL TOWER", "LEANING TOWER OF PIZA", "STARBUCKS", "MOUNT EVEREST", "AMERICAN EAGLE", "AMAZON RIVER", "BIG BEN", "MOUNT RUSHMORE", "NIAGRA FALLS", "SPACE NEEDLE"]
    var intermediatePhrases = ["UNDER THE WEATHER", "ONCE IN A BLUE MOON", "TASTE OF YOUR OWN MEDICINE"]
    var advancedPhrases = ["NEW ZEALAND", "MEDITERRANIAN SEA", "NORTH POLE", "DEVILS ADVOCATE"]
    
 
    func beginnerMode() {
        var randomElement = 0
        randomElement = Int(arc4random_uniform(UInt32(beginnerPhrases.count)))
        _phrase = beginnerPhrases[randomElement]
        beginnerPhrases.remove(at: randomElement)
        _chancesRemaining = 7
        _levelTitleLabel = "Beginner"
        secret = _phrase
        levelTitleLabelGlobal = levelTitleLabel
       
    }
    func intermediateMode() {
        var randomElement = 0
        randomElement = Int(arc4random_uniform(UInt32(intermediatePhrases.count)))
        _phrase = intermediatePhrases[randomElement]
        intermediatePhrases.remove(at: randomElement)
        _chancesRemaining = 7
        _levelTitleLabel = "Intermediate"
        secret = _phrase
        levelTitleLabelGlobal = levelTitleLabel
    }
    func advancedMode() {
        var randomElement = 0
        randomElement = Int(arc4random_uniform(UInt32(advancedPhrases.count)))
        _phrase = advancedPhrases[randomElement]
        advancedPhrases.remove(at: randomElement)
        _chancesRemaining = 7
        _levelTitleLabel = "Advanced"
        secret = _phrase
        levelTitleLabelGlobal = levelTitleLabel
    }
    func customGameMode() {
        _phrase = customGamePhrase
        _levelTitleLabel = "Custom Game"
        levelTitleLabelGlobal = levelTitleLabel
        _chancesRemaining = 7
        secret = _phrase
        
    }
    
    
    
}
