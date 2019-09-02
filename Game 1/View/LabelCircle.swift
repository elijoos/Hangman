//
//  RoundView.swift
//  Game 1
//
//  Created by COMPUTER on 1/22/18.
//  Copyright © 2018 COMPUTER. All rights reserved.
//


import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
}
