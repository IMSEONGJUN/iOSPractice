//
//  RegisterViewController.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/27.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let titleLabel = UILabel()
    let infoContainerView = UIView()
    let idTextField = UITextField()
    let pwTextField = UITextField()
    let pwDoubleCheckTextField = UITextField()
    let registerButton = UIButton()
    let cancelButton = UIButton()
       
    let separatorIdTextField = UIView()
    let separatorPwTextField = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setConstraints()
    }
        
    @objc func didTapButton(_ sender: UIButton) {
        switch sender {
        case cancelButton:
            self.dismiss(animated: true, completion: nil)
        default:
            guard idTextField.text != "" else {
                simpleAlert(message: "아이디를 입력하세요")
                return
            }
            guard pwTextField.text != "" else {
                simpleAlert(message: "패스워드를 입력하세요")
                return
            }
            guard pwDoubleCheckTextField.text != "" else {
                simpleAlert(message: "패스워드 확인을 입력하세요")
                return
            }
            guard pwTextField.text == pwDoubleCheckTextField.text else {
                simpleAlert(message: "패스워드 확인에 실패하였습니다")
                return
            }
            
            UserDefaults.standard.set(idTextField.text!, forKey: "newID")
            UserDefaults.standard.set(pwTextField.text!, forKey: "newPW")
            
            customAlert(title: "가입", message: "가입되었습니다.\n로그인해주세요", firstActionTitle: "OK", completed1: {self.dismiss(animated: true, completion: nil)})
        }
    }
    
    deinit {
        print("RegisterVC deinit")
    }
}
