//
//  ViewControllerHiddenNumber.swift
//  Game
//
//  Created by Никита on 18/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

class ViewControllerHiddenNumber: UIViewController {
    
    let viewHiddenNumber = ViewHiddenNumber()
    let vcGamePC = VCPlayerVsPC()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = viewHiddenNumber
        
        viewHiddenNumber.delegate = self
    }
    
}

extension ViewControllerHiddenNumber: ViewHiddenNumberToVC {
    
    func buttonGoPress() {
        
        if 1...100 ~= Int(viewHiddenNumber.TextField.text ?? "") ?? -1 {
            vcGamePC.setHiddenNumber(number: Int(viewHiddenNumber.TextField.text ?? "") ?? -1)
            self.navigationController?.pushViewController(vcGamePC, animated: true)
        } else {
            self.present(viewHiddenNumber.alert, animated: true, completion: nil)
        }
       
    }
    
}
