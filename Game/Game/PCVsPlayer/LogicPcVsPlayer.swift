//
//  LogicPcVsPlayer.swift
//  Game
//
//  Created by Никита on 18/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import Foundation

protocol logicToVC: AnyObject {
    func setLabel(text: String)
    func setAttempt(number: Int)
    func returnAttempt(number: Int)
    func result()
}

class LogicPcVsPlayer {
    
    weak var delegate: logicToVC?
    
    var HiddenNumber = Int()
    var numberOfAttempt = 0
    
    init(number: Int) {
        self.HiddenNumber = number
    }
    
    func checkNumber(number: Int) {
        if number > HiddenNumber {
            numberOfAttempt += 1
            delegate?.setLabel(text: "меньше")
            delegate?.setAttempt(number: numberOfAttempt)
        } else if number < HiddenNumber {
            numberOfAttempt += 1
            delegate?.setLabel(text: "Больше")
            delegate?.setAttempt(number: numberOfAttempt)
        } else {
            numberOfAttempt += 1
            delegate?.returnAttempt(number: numberOfAttempt)
            delegate?.setLabel(text: "Угадали")
            delegate?.result()
        }
    }
    
}
