//
//  CustomView.swift
//  Game 1
//
//  Created by COMPUTER on 12/13/17.
//  Copyright © 2017 COMPUTER. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.frame.width / 2
    }
    

}
