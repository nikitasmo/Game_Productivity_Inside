//
//  ViewController.swift
//  Game
//
//  Created by Никита on 17/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

class VCPlayerVsPC: UIViewController {
    
    let vcPCVsPlayer = VCPCvsPlayer()

    let viewPlayerVsPC = ViewPlayerVsPC()
    
    var start = Logical()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = viewPlayerVsPC
        
        start.delegate = self
        viewPlayerVsPC.delegate = self
        
        start.startGame()
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func setHiddenNumber(number: Int) {
        start.setHiddenNumber(number: number)
    }

}

extension VCPlayerVsPC: LogicToVC {
    
    func GuessNumber(number: Int) {
        viewPlayerVsPC.LabelGuess.text = "Угадываю... " + String(number) + " ?"
    }
    
    func setNumberAttempts(number: Int) {
        viewPlayerVsPC.LabelAttempts.text = "Количество попыток... " + String(number)
    }
    
}

extension VCPlayerVsPC: ViewToVC {
    
    func ButtonLessPress() {
        if start.guess < start.HiddenNumber {
            self.present(viewPlayerVsPC.alertErrorLess, animated: true, completion: nil)
        } else if start.guess == start.HiddenNumber {
            self.present(viewPlayerVsPC.alertErrorEqual, animated: true, completion: nil)
        } else {
            start.ButtonLess()
            start.startGame()
        }
    }
    
    func ButtonMorePress() {
        if start.guess > start.HiddenNumber {
            self.present(viewPlayerVsPC.alertErrorMore, animated: true, completion: nil)
        } else if start.guess == start.HiddenNumber {
            self.present(viewPlayerVsPC.alertErrorEqual, animated: true, completion: nil)
        } else {
            start.ButtonMore()
            start.startGame()
        }
    }
    
    func ButtonEqualPress() {
        if start.guess == start.HiddenNumber {
            vcPCVsPlayer.setStrorageNumberAttemptPC(number: start.returnAttemptPC())
            self.navigationController?.pushViewController(vcPCVsPlayer, animated: true)
        } else {
            self.present(viewPlayerVsPC.alert, animated: true, completion: nil)
        }
    }
    
}


