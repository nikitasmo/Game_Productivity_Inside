//
//  ViewPcVsPlayer.swift
//  Game
//
//  Created by Никита on 18/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

protocol ViewPcVsPlayerToVC: AnyObject {
    func numberEnter(number: Int)
}

class ViewPcVsPlayer: UIView {
    
    weak var delegate: ViewPcVsPlayerToVC?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textField.delegate = self
        
        self.backgroundColor = .white
        
        self.addSubview(label)
        self.addSubview(labelHidden)
        self.addSubview(textField)
        self.addSubview(LabelAttempts)
        
        configureConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel = {
        var label = UILabel()
        label.text = "Теперь вы должны угадать число"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var textField: UITextField = {
        var textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var labelHidden: UILabel = {
        var label = UILabel()
        label.text = "Введите число"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var LabelAttempts: UILabel = {
        var label = UILabel()
        label.text = "Количество попыток... 0"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var alert: UIAlertController = {
        var alert = UIAlertController(title: nil, message: "Введите число от 1 до 100", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        return alert
    }()
    
}

extension ViewPcVsPlayer {
    func configureConstraint() {
        //label
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50).isActive = true
        
        //labelAttempts
        LabelAttempts.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        LabelAttempts.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        LabelAttempts.topAnchor.constraint(equalTo: self.topAnchor,constant: 30).isActive = true
        LabelAttempts.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //textField
        textField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        //labelHidden
        labelHidden.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        labelHidden.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
    }
}

extension ViewPcVsPlayer: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        delegate?.numberEnter(number: Int(textField.text ?? "") ?? -1)
        textField.text = ""
        
        textField.resignFirstResponder()
        
        return true
    }
}
