//
//  CircleLabel.swift
//  Game 1
//
//  Created by COMPUTER on 1/22/18.
//  Copyright © 2018 COMPUTER. All rights reserved.
//

import UIKit

class CircleLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 45.0
    }
}
