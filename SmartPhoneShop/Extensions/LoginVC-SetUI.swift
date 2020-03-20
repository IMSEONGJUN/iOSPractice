//
//  LoginVC-SetUI.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/27.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    func setupUI() {
        view.addSubview(firstContainerViewFromUpSide)
        firstContainerViewFromUpSide.backgroundColor = .white
        logoImageView.image = UIImage(named: "frisbee")
        logoImageView.contentMode = .scaleAspectFit
        
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        rectangle1.backgroundColor = .black
        rectangle1.layer.cornerRadius = 5
        
        rectangle2.backgroundColor = .black
        rectangle2.layer.cornerRadius = 5
        
        rectangle3.backgroundColor = .black
        rectangle3.layer.cornerRadius = 5
        
        firstContainerViewFromUpSide.addSubview(logoImageView)
        firstContainerViewFromUpSide.addSubview(stackView)
        firstContainerViewFromUpSide.addSubview(rectangle1)
        firstContainerViewFromUpSide.addSubview(rectangle2)
        firstContainerViewFromUpSide.addSubview(rectangle3)
        
        view.addSubview(secondContainerViewFromUpSide)
        
        secondContainerViewFromUpSide.backgroundColor = .white
        
        emailStackView.backgroundColor = .white
        view.addSubview(thirdContainerViewFromUpSide)
        thirdContainerViewFromUpSide.backgroundColor = .white
        thirdContainerViewFromUpSide.addSubview(emailStackView)
        thirdContainerViewFromUpSide.addSubview(pwStackView)
        
        emailImage.image = UIImage(named: "email")
        emailStackView.addSubview(emailImage)
        emailTextField.backgroundColor = .white
        emailTextField.keyboardType = .default
        emailTextField.autocapitalizationType = .none
        emailStackView.addSubview(emailTextField)
        
        pwImage.image = UIImage(named: "password")
        pwTextField.backgroundColor = .white
        pwTextField.isSecureTextEntry = true
        pwStackView.addSubview(pwImage)
        pwStackView.addSubview(pwTextField)
        pwStackView.backgroundColor = .white
        
        view.addSubview(fourthContainerViewFromUpSide)
        fourthContainerViewFromUpSide.addSubview(loginButton)
        fourthContainerViewFromUpSide.addSubview(signupButton)
        
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 5
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        signupButton.backgroundColor = .black
        signupButton.layer.cornerRadius = 5
        signupButton.setTitle("SignUp", for: .normal)
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        signupButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        drawLine()
    }
}
