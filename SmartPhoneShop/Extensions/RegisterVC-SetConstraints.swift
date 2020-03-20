//
//  RegisterVC-SetConstraints.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2020/01/04.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension RegisterViewController {
    func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        infoContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        infoContainerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -24).isActive = true
        infoContainerView.heightAnchor.constraint(equalToConstant: 210).isActive = true

        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.topAnchor.constraint(equalTo: infoContainerView.topAnchor).isActive = true
        idTextField.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 12).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        idTextField.heightAnchor.constraint(equalTo: infoContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        separatorIdTextField.translatesAutoresizingMaskIntoConstraints = false
        separatorIdTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor).isActive = true
        separatorIdTextField.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 12).isActive = true
        separatorIdTextField.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        separatorIdTextField.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor).isActive = true
        pwTextField.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 12).isActive = true
        pwTextField.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        pwTextField.heightAnchor.constraint(equalTo: infoContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        separatorPwTextField.translatesAutoresizingMaskIntoConstraints = false
        separatorPwTextField.topAnchor.constraint(equalTo: pwTextField.bottomAnchor).isActive = true
        separatorPwTextField.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 12).isActive = true
        separatorPwTextField.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        separatorPwTextField.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        pwDoubleCheckTextField.translatesAutoresizingMaskIntoConstraints = false
        pwDoubleCheckTextField.topAnchor.constraint(equalTo: pwTextField.bottomAnchor).isActive = true
        pwDoubleCheckTextField.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 12).isActive = true
        pwDoubleCheckTextField.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        pwDoubleCheckTextField.heightAnchor.constraint(equalTo: infoContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: infoContainerView.bottomAnchor, constant: 50).isActive = true
        registerButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 2/3).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 30).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 2/3).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

}
