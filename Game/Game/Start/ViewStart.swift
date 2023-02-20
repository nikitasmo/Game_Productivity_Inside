//
//  ViewStart.swift
//  Game
//
//  Created by Никита on 18/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

protocol ViewStartToVC: AnyObject {
    func startPressed()
}

class ViewStart: UIView {
    
    weak var delegate: ViewStartToVC?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(ButtonStart)
        self.addSubview(label)
        
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var ButtonStart: UIButton = {
        var button = UIButton()
        button.setTitle("Start New Game", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonStartPressed), for: .touchUpInside)
        return button
    }()
    
    var label: UILabel = {
        var label = UILabel()
        label.text = "My Awesome Game"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

extension ViewStart {
    func configureConstraint() {
        //buttonStart
        ButtonStart.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        ButtonStart.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        ButtonStart.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        ButtonStart.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        //label
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
    }
}

//target

extension ViewStart {
    @objc func buttonStartPressed() {
        delegate?.startPressed()
    }
}
