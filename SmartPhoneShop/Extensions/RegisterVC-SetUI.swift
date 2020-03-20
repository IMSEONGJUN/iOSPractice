//
//  RegisterVC-SetUI.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2020/01/04.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension RegisterViewController {
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(infoContainerView)
        view.addSubview(registerButton)
        view.addSubview(cancelButton)
        infoContainerView.addSubview(idTextField)
        infoContainerView.addSubview(pwTextField)
        infoContainerView.addSubview(pwDoubleCheckTextField)
        infoContainerView.addSubview(separatorIdTextField)
        infoContainerView.addSubview(separatorPwTextField)
        
        titleLabel.text = "회원가입"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        infoContainerView.backgroundColor = .yellow
        infoContainerView.layer.cornerRadius = 6
        separatorIdTextField.backgroundColor = .lightGray
        separatorPwTextField.backgroundColor = .lightGray
    
        idTextField.placeholder = "아이디"
        idTextField.autocapitalizationType = .none
        pwTextField.placeholder = "패스워드"
        pwTextField.isSecureTextEntry = true
        pwDoubleCheckTextField.placeholder = "패스워드 확인"
        pwDoubleCheckTextField.isSecureTextEntry = true
      
        registerButton.setTitle("가입", for: .normal)
        registerButton.backgroundColor = .lightGray
        registerButton.layer.cornerRadius = 6
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        registerButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = .lightGray
        cancelButton.layer.cornerRadius = 6
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cancelButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
    }

}
