//
//  ScoreCell.swift
//  Game 1
//
//  Created by COMPUTER on 1/25/18.
//  Copyright © 2018 COMPUTER. All rights reserved.
//

import UIKit

class ScoreCell: UITableViewCell {

    @IBOutlet weak var difficultyNameLabel: UILabel!
    
    @IBOutlet weak var difficultyTrophyTotalLabel: UILabel!
    
    var cellColor: UIColor!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func ConfigureCell(score: Score, difficulty: String) {

        switch difficulty {
        case "beginner":
            difficultyTrophyTotalLabel.text = "\(score.beginnerScore)"

            break
        case "intermediate":
            difficultyTrophyTotalLabel.text = "\(score.intermediateScore)"
            break
        case "advanced":
             difficultyTrophyTotalLabel.text = "\(score.advancedScore)"
        default:
            print("didn't work")
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
