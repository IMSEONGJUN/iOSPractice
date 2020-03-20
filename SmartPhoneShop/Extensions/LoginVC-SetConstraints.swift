//
//  LoingVC-SetConstraints.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/27.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    func setConstraints() {
        firstContainerViewFromUpSide.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstContainerViewFromUpSide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstContainerViewFromUpSide.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            firstContainerViewFromUpSide.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            firstContainerViewFromUpSide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: firstContainerViewFromUpSide.topAnchor, constant: 80).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: firstContainerViewFromUpSide.heightAnchor, multiplier: 0.25).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: firstContainerViewFromUpSide.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10).isActive = true
        stackView.widthAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.4).isActive = true
        stackView.heightAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 0.4).isActive = true
        stackView.addArrangedSubview(rectangle1)
        stackView.addArrangedSubview(rectangle2)
        stackView.addArrangedSubview(rectangle3)
        
        secondContainerViewFromUpSide.translatesAutoresizingMaskIntoConstraints = false
        secondContainerViewFromUpSide.topAnchor.constraint(equalTo: firstContainerViewFromUpSide.bottomAnchor).isActive = true
        secondContainerViewFromUpSide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        secondContainerViewFromUpSide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        secondContainerViewFromUpSide.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
        
        thirdContainerViewFromUpSide.translatesAutoresizingMaskIntoConstraints = false
        thirdContainerViewTopAnchor = thirdContainerViewFromUpSide.topAnchor.constraint(equalTo: secondContainerViewFromUpSide.bottomAnchor)
        thirdContainerViewTopAnchor.isActive = true
        thirdContainerViewFromUpSide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        thirdContainerViewFromUpSide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        thirdContainerViewFromUpSide.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25).isActive = true
        
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.topAnchor.constraint(equalTo: thirdContainerViewFromUpSide.topAnchor, constant: 30).isActive = true
        emailStackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailStackView.heightAnchor.constraint(equalTo: thirdContainerViewFromUpSide.heightAnchor, multiplier: 0.3).isActive = true
        emailStackView.centerXAnchor.constraint(equalTo: thirdContainerViewFromUpSide.centerXAnchor).isActive = true
        
        pwStackView.translatesAutoresizingMaskIntoConstraints = false
        pwStackView.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 20).isActive = true
        pwStackView.widthAnchor.constraint(equalTo: emailStackView.widthAnchor).isActive = true
        pwStackView.heightAnchor.constraint(equalTo: emailStackView.heightAnchor).isActive = true
        pwStackView.centerXAnchor.constraint(equalTo: emailStackView.centerXAnchor).isActive = true
        
        emailImage.translatesAutoresizingMaskIntoConstraints = false
        emailImage.topAnchor.constraint(equalTo: emailStackView.topAnchor, constant: 13).isActive = true
        emailImage.leadingAnchor.constraint(equalTo: emailStackView.leadingAnchor, constant: 8).isActive = true
        emailImage.bottomAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: -10).isActive = true
        emailImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leadingAnchor.constraint(equalTo: emailImage.trailingAnchor, constant: 10).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: emailStackView.widthAnchor, multiplier: 0.82).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: emailStackView.heightAnchor, multiplier: 0.8).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: emailStackView.centerYAnchor).isActive = true
        
        pwImage.translatesAutoresizingMaskIntoConstraints = false
        pwImage.topAnchor.constraint(equalTo: pwStackView.topAnchor, constant: 13).isActive = true
        pwImage.leadingAnchor.constraint(equalTo: pwStackView.leadingAnchor, constant: 8).isActive = true
        pwImage.bottomAnchor.constraint(equalTo: pwStackView.bottomAnchor, constant: -10).isActive = true
        pwImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.leadingAnchor.constraint(equalTo: pwImage.trailingAnchor, constant: 10).isActive = true
        pwTextField.widthAnchor.constraint(equalTo: pwStackView.widthAnchor, multiplier: 0.82).isActive = true
        pwTextField.heightAnchor.constraint(equalTo: pwStackView.heightAnchor, multiplier: 0.8).isActive = true
        pwTextField.centerYAnchor.constraint(equalTo: pwStackView.centerYAnchor).isActive = true
        
        fourthContainerViewFromUpSide.translatesAutoresizingMaskIntoConstraints = false
        fourthContainerViewFromUpSide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        fourthContainerViewFromUpSide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        fourthContainerViewFromUpSide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: fourthContainerViewFromUpSide.topAnchor, constant: 20).isActive = true
        loginButton.widthAnchor.constraint(equalTo: fourthContainerViewFromUpSide.widthAnchor, multiplier: 0.8).isActive = true
        loginButton.heightAnchor.constraint(equalTo: fourthContainerViewFromUpSide.heightAnchor, multiplier: 0.2).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: fourthContainerViewFromUpSide.centerXAnchor).isActive = true
        
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        signupButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        signupButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor).isActive = true
        signupButton.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor).isActive = true

    }

}
