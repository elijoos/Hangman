//
//  Extentions.swift
//  Game 1
//
//  Created by COMPUTER on 11/27/17.
//  Copyright © 2017 COMPUTER. All rights reserved.
//

import Foundation
extension Array {
    func getRandomElement() -> Element {
        let randomIndex = Int(arc4random()) % count
        return self[randomIndex]
    }
}


