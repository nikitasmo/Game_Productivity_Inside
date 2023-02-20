//
//  ViewPlayerVsPC.swift
//  Game
//
//  Created by Никита on 17/02/2023.
//  Copyright © 2023 com.example. All rights reserved.
//

import UIKit

protocol ViewToVC: AnyObject {
    func ButtonLessPress()
    func ButtonMorePress()
    func ButtonEqualPress()
}

class ViewPlayerVsPC: UIView {
    
    weak var delegate: ViewToVC?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(LabelAttempts)
        self.addSubview(label)
        self.addSubview(LabelGuess)
        self.addSubview(buttonLess)
        self.addSubview(buttonEqual)
        self.addSubview(buttonMore)

        
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel = {
        var label = UILabel()
        label.text = "Компьютер должен угадать ваше число"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var LabelGuess: UILabel = {
        var label = UILabel()
        label.text = "Угадываю..."
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
    
    var buttonLess: UIButton = {
        var button = UIButton()
        button.setTitle("Меньше", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ButtonLessPressed), for: .touchUpInside)
        return button
    }()
    
    var buttonEqual: UIButton = {
        var button = UIButton()
        button.setTitle("Равно", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ButtonEqualPressed), for: .touchUpInside)
        return button
    }()
    
    var buttonMore: UIButton = {
        var button = UIButton()
        button.setTitle("Больше", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ButtonMorePress), for: .touchUpInside)
        return button
    }()
    
    var alert: UIAlertController = {
        var alert = UIAlertController(title: nil, message: "Вы загадали другое число", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        return alert
    }()
    
    var alertErrorLess: UIAlertController = {
        var alert = UIAlertController(title: nil, message: "Ошибка!!! Загаданное число больше", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        return alert
    }()
    
    var alertErrorMore: UIAlertController = {
        var alert = UIAlertController(title: nil, message: "Ошибка!!! Загаданное число меньше", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        return alert
    }()
    
    var alertErrorEqual: UIAlertController = {
        var alert = UIAlertController(title: nil, message: "Ошибка!!! Компьютер отгадал число", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        return alert
    }()
    
    
    
}
extension ViewPlayerVsPC {
    func configureConstraint() {
        
        //labelAttempts
        LabelAttempts.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        LabelAttempts.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        LabelAttempts.topAnchor.constraint(equalTo: self.topAnchor,constant: 30).isActive = true
        LabelAttempts.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //label
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100).isActive = true
        
        //labelGuess
        LabelGuess.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        LabelGuess.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        //buttonLess
        buttonLess.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        buttonLess.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        buttonLess.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        buttonLess.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //buttonEqual
        buttonEqual.leadingAnchor.constraint(equalTo: self.buttonLess.trailingAnchor).isActive = true
        buttonEqual.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        buttonEqual.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        buttonEqual.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //buttonMore
        buttonMore.leadingAnchor.constraint(equalTo: self.buttonEqual.trailingAnchor).isActive = true
        buttonMore.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        buttonMore.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        buttonMore.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

//targer

extension ViewPlayerVsPC {
    @objc func ButtonLessPressed() {
        delegate?.ButtonLessPress()
    }
    
    @objc func ButtonMorePress() {
        delegate?.ButtonMorePress()
    }
    
    @objc func ButtonEqualPressed() {
        delegate?.ButtonEqualPress()
    }
}
