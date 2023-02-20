//
//  ViewResult.swift
//  Game
//
//  Created by Никита on 18/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

protocol viewResultToVC: AnyObject {
    func buttonReturnPressed()
}

class ViewResult: UIView {
    
    weak var delegate: viewResultToVC?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(labelAttemptPc)
        self.addSubview(labelAttemptPlayer)
        self.addSubview(labelresult)
        self.addSubview(buttonReturn)
        
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var labelAttemptPc: UILabel = {
        var label = UILabel()
        label.text = "Количество попыток компьютера: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelAttemptPlayer: UILabel = {
        var label = UILabel()
        label.text = "Количество попыток игрока: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelresult: UILabel = {
        var label = UILabel()
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var buttonReturn: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.setTitle("Main menu", for: .normal)
        button.addTarget(self, action: #selector(buttonreturnPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

extension ViewResult {
    func configureConstraint() {
        //labelPC
        labelAttemptPc.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        labelAttemptPc.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50).isActive = true
        
        //labelPlayer
        labelAttemptPlayer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        labelAttemptPlayer.topAnchor.constraint(equalTo: labelAttemptPc.bottomAnchor).isActive = true
        
        //labelResult
        labelresult.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        labelresult.topAnchor.constraint(equalTo: labelAttemptPlayer.bottomAnchor, constant: 20).isActive = true
        
//        //buttonMenu
        buttonReturn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        buttonReturn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        buttonReturn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        buttonReturn.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
}

//target

extension ViewResult {
    @objc func buttonreturnPressed() {
        delegate?.buttonReturnPressed()
    }
}
