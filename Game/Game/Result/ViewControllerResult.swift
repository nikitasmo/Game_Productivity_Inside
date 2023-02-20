//
//  ViewControllerResult.swift
//  Game
//
//  Created by Никита on 18/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

class ViewControllerResult: UIViewController {
    
//    let viewStart = ViewControllerHiddenNumber()
    
    let viewResult = ViewResult()
    
    var AttemptPC = Int()
    var AttemptPlayer = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewResult.delegate = self

        view = viewResult
    }
    
    func setAttemptPlayer(number: Int) {
        AttemptPlayer = number
        viewResult.labelAttemptPlayer.text = "Количество попыток игрока: " + String(AttemptPlayer)
    }
    
    func setAttemptPC(number: Int) {
        AttemptPC = number
        viewResult.labelAttemptPc.text = "Количество попыток компьютера: " + String(AttemptPC)
    }

    func ShowResult() {
        if AttemptPC > AttemptPlayer {
            viewResult.labelresult.text = "Выиграли Вы"
        } else if AttemptPlayer > AttemptPC {
            viewResult.labelresult.text = "Выиграл компьютер"
        } else if AttemptPlayer == AttemptPC {
            viewResult.labelresult.text = "Ничья"
        }
    }


}

extension ViewControllerResult: viewResultToVC {
    func buttonReturnPressed() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
