//
//  ViewControllerStart.swift
//  Game
//
//  Created by Никита on 18/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

class ViewControllerStart: UIViewController {
    
    let viewStart = ViewStart()
    let VCHiddenNumber = ViewControllerHiddenNumber()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewStart.delegate = self

        view = viewStart
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    


}

extension ViewControllerStart: ViewStartToVC {
    func startPressed() {
        self.navigationController?.pushViewController(VCHiddenNumber, animated: true)
    }
    
}
