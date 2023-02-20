//
//  VCPCvsPlayer.swift
//  Game
//
//  Created by Никита on 18/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

class VCPCvsPlayer: UIViewController {
    
    var StorageNumberAttemptPC = Int()
    
    let viewPcVsPlayer = ViewPcVsPlayer()
    let vcResult = ViewControllerResult()
    
    var logic = LogicPcVsPlayer(number: Int.random(in: 1...100))

    override func viewDidLoad() {
        super.viewDidLoad()

        view = viewPcVsPlayer
        
        viewPcVsPlayer.delegate = self
        logic.delegate = self
        
        
    }
    
    func setStrorageNumberAttemptPC(number: Int) {
        StorageNumberAttemptPC = number
    }

}

extension VCPCvsPlayer: ViewPcVsPlayerToVC {
    func numberEnter(number: Int) {
        
        if 1...100 ~= number {
            logic.checkNumber(number: number)
        } else {
            self.present(viewPcVsPlayer.alert, animated: true, completion: nil)
        }
        
    }
    
}

extension VCPCvsPlayer: logicToVC {
    
    func result() {
        self.navigationController?.pushViewController(vcResult, animated: true)
    }
    
    
    func setLabel(text: String) {
        viewPcVsPlayer.labelHidden.text = text
    }
    
    func setAttempt(number: Int) {
        viewPcVsPlayer.LabelAttempts.text = "Количество попыток... " + String(number)
    }
    
    func returnAttempt(number: Int) {
        vcResult.setAttemptPlayer(number: number)
        vcResult.setAttemptPC(number: StorageNumberAttemptPC)
        vcResult.ShowResult()
    }
}
