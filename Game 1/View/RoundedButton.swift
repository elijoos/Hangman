//
//  RoundedButton.swift
//  Game 1
//
//  Created by COMPUTER on 11/28/17.
//  Copyright © 2017 COMPUTER. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10.0
       
    }

}
