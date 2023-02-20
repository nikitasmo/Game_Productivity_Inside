//
//  Logical.swift
//  Game
//
//  Created by Никита on 17/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

protocol LogicToVC: AnyObject {
    func GuessNumber(number: Int)
    func setNumberAttempts(number: Int)
}

class Logical {
    
    weak var delegate: LogicToVC?
    
    var HiddenNumber = Int()
    
    var NumberMin = 1
    var NumberMax = 100
    
    var guess = Int()
    
    var NumberOfAttempts = 0
    
    func setHiddenNumber(number: Int) {
        self.HiddenNumber = number
    }
    
    func startGame() {
        delegate?.GuessNumber(number: GuessNumberFunction())
    }
    
    func GuessNumberFunction() -> Int {
        guess = Int.random(in: NumberMin...NumberMax)
        return guess
    }
    
    func ButtonLess() {
        NumberMax = guess
        NumberOfAttempts += 1
        delegate?.setNumberAttempts(number: NumberOfAttempts)
    }
    
    func ButtonMore() {
        NumberMin = guess
        NumberOfAttempts += 1
        delegate?.setNumberAttempts(number: NumberOfAttempts)
    }
    
    func returnAttemptPC() -> Int {
        return NumberOfAttempts
    }
}


