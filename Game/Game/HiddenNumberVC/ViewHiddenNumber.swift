//
//  ViewHiddenNumber.swift
//  Game
//
//  Created by Никита on 18/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

protocol ViewHiddenNumberToVC: AnyObject {
    func buttonGoPress()
}

class ViewHiddenNumber: UIView {
    
    weak var delegate: ViewHiddenNumberToVC?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        TextField.delegate = self
        
        self.backgroundColor = .white
        
        self.addSubview(TextField)
        self.addSubview(buttonStart)
        
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var TextField: UITextField = {
        var textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.placeholder = "Guess the number"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var buttonStart: UIButton = {
        var button = UIButton()
        button.setTitle("Enter the Number", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ButtonGoPressed), for: .touchUpInside)
        return button
    }()
    
//    var alert = UIAlertController(title: nil, message: "Введите число от 1 до 100", preferredStyle: .alert)
    var alert: UIAlertController = {
        var alert = UIAlertController(title: nil, message: "Введите число от 1 до 100", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        return alert
    }()
    
}

extension ViewHiddenNumber {
    func configureConstraint() {
        //textField
        TextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        TextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        TextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        TextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        //button
        buttonStart.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        buttonStart.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        buttonStart.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        buttonStart.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
}

//terget

extension ViewHiddenNumber {
    @objc func ButtonGoPressed() {
        
        delegate?.buttonGoPress()

    }
}

extension ViewHiddenNumber: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

