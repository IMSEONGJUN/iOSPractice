//
//  LoginViewController.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/26.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let firstContainerViewFromUpSide = UIView()
    let logoImageView = UIImageView()
    let stackView = UIStackView()
    let rectangle1 = UIView()
    let rectangle2 = UIView()
    let rectangle3 = UIView()
    
    let secondContainerViewFromUpSide = UIView()
    
    
    let thirdContainerViewFromUpSide = UIView()
    let emailStackView = UIView()
    let emailImage = UIImageView()
    let emailTextField = UITextField()
    let pwStackView = UIView()
    let pwImage = UIImageView()
    let pwTextField = UITextField()
    
    
    let fourthContainerViewFromUpSide = UIView()
    let loginButton = UIButton()
    let signupButton = UIButton()
    
    
    var thirdContainerViewTopAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUserDefault()
        self.emailTextField.delegate = self
        self.pwTextField.delegate = self
        setupUI()
        setupDefaultIDAndPW()
        SingletonData.shared.budget = 100_000
    }
  
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setConstraints()
    }
    
        
    @objc func didTapButton(_ sender: UIButton) {
        
        let dfID = UserDefaults.standard.string(forKey: "DfID")
        let dfPW = UserDefaults.standard.string(forKey: "DfPW")
        let newID = UserDefaults.standard.string(forKey: "newID")
        let newPW = UserDefaults.standard.string(forKey: "newPW")
        
        switch sender {
        case loginButton:
            guard self.emailTextField.text != "" else {
                simpleAlert(message: "아이디를 입력하세요")
                return
            }
            guard self.pwTextField.text != "" else {
                simpleAlert(message: "패스워드를 입력하세요")
                return
            }
        
            guard (self.emailTextField.text == dfID && self.pwTextField.text == dfPW) || (self.emailTextField.text == newID && self.pwTextField.text == newPW)  else {
                simpleAlert(message: "로그인에 실패하였습니다")
                return
            }
            
            UserDefaults.standard.set(self.emailTextField.text, forKey: "loggedInID")
            UserDefaults.standard.set(self.pwTextField.text, forKey: "loggedInPW")
            
            if #available(iOS 13.0, *) {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    let window = UIWindow(windowScene: windowScene)
                    window.makeKeyAndVisible()
                    
                    let mvc = MainViewController()
                    mvc.leftbarTitle = self.emailTextField.text ?? ""
                    let shoppingBag = ShoppingBagViewController()
                    
                    let mainNavi = UINavigationController(rootViewController: mvc)
                    mainNavi.tabBarItem = UITabBarItem(title: "list", image: UIImage(systemName: "folder.fill"), tag: 0)
                    let shopingBagNavi = UINavigationController(rootViewController: shoppingBag)
                    shopingBagNavi.tabBarItem = UITabBarItem(title: "장바구니", image: UIImage(systemName: "person.circle"), tag: 1)
                    
                    let tabBarController = UITabBarController()
                    tabBarController.viewControllers = [mainNavi, shopingBagNavi]
                    
                    window.rootViewController = tabBarController
                    
                    let sceneDelegate = windowScene.delegate as? SceneDelegate
                    sceneDelegate?.window = window
                    
                }
            } else {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let window = UIWindow(frame: UIScreen.main.bounds)
                
                let mvc = MainViewController()
                mvc.leftbarTitle = self.emailTextField.text ?? ""
                let shoppingBag = ShoppingBagViewController()
                
                let mainNavi = UINavigationController(rootViewController: mvc)
                mainNavi.tabBarItem = UITabBarItem(title: "list", image: UIImage(systemName: "folder.fill"), tag: 0)
                let shopingBagNavi = UINavigationController(rootViewController: shoppingBag)
                shopingBagNavi.tabBarItem = UITabBarItem(title: "장바구니", image: UIImage(systemName: "person.circle"), tag: 1)
                
                let tabBarController = UITabBarController()
                tabBarController.viewControllers = [mainNavi, shopingBagNavi]
              
                window.rootViewController = tabBarController
                window.makeKeyAndVisible()
                appDelegate.window = window
            }
        default:
            let rv = RegisterViewController()
            rv.modalPresentationStyle = .fullScreen
            present(rv, animated: true)
        }
    }
    
    deinit {
        print("LoginVC deinit")
    }
    
}
