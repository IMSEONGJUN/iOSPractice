//
//  LoginViewController+Ext.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/27.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func drawLine() {
        let doYourPath = UIBezierPath(rect: CGRect(x: 100, y: 155, width: 250, height: 0.5))
        let layer = CAShapeLayer()
        layer.path = doYourPath.cgPath
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.fillColor = UIColor.lightGray.cgColor

        self.thirdContainerViewFromUpSide.layer.addSublayer(layer)
        
        let doYourPath2 = UIBezierPath(rect: CGRect(x: 100, y: 80, width: 250, height: 0.5))
        let layer2 = CAShapeLayer()
        layer2.path = doYourPath2.cgPath
        layer2.strokeColor = UIColor.lightGray.cgColor
        layer2.fillColor = UIColor.lightGray.cgColor

        self.thirdContainerViewFromUpSide.layer.addSublayer(layer2)
    }
    
    func checkUserDefault() {
        guard let loggedInId = UserDefaults.standard.string(forKey: "loggedInID") else {return}
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                window.makeKeyAndVisible()
                print("iOS 13")
                let mvc = MainViewController()
                mvc.leftbarTitle = loggedInId
                let shoppingBag = ShoppingBagViewController()

                let mainNavi = UINavigationController(rootViewController: mvc)
                mainNavi.tabBarItem = UITabBarItem(title: "list", image: UIImage(systemName: "folder.fill"), tag: 0)
                let shopingBagNavi = UINavigationController(rootViewController: shoppingBag)
                shopingBagNavi.tabBarItem = UITabBarItem(title: "장바구니", image: UIImage(systemName: "person.circle"), tag: 1)

                let tabBarController = UITabBarController()
                tabBarController.viewControllers = [mainNavi, shopingBagNavi]

                window.backgroundColor = .systemBackground
                window.rootViewController = tabBarController
                
                let sceneDelegate = windowScene.delegate as? SceneDelegate
                sceneDelegate?.window = window
                
            }
        } else {
            print("iOS 12")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let window = UIWindow(frame: UIScreen.main.bounds)
            
            let mvc = MainViewController()
            mvc.leftbarTitle = loggedInId
            let shoppingBag = ShoppingBagViewController()
            
            let mainNavi = UINavigationController(rootViewController: mvc)
            mainNavi.tabBarItem = UITabBarItem(title: "list", image: UIImage(systemName: "folder.fill"), tag: 0)
            let shopingBagNavi = UINavigationController(rootViewController: shoppingBag)
            shopingBagNavi.tabBarItem = UITabBarItem(title: "장바구니", image: UIImage(systemName: "person.circle"), tag: 1)
            
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [mainNavi, shopingBagNavi]
            
            window.backgroundColor = .systemBackground
            window.rootViewController = tabBarController
            window.makeKeyAndVisible()
            appDelegate.window = window
        }
    }
    
    func setupDefaultIDAndPW() {
        UserDefaults.standard.set("naroti", forKey: "DfID")
        UserDefaults.standard.set("1234", forKey: "DfPW")
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 0.5) {
            self.thirdContainerViewTopAnchor.constant = -100
            self.view.layoutIfNeeded()
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            textField.resignFirstResponder()
            pwTextField.becomeFirstResponder()
        default:
            UIView.animate(withDuration: 0.5) {
                self.thirdContainerViewTopAnchor.constant = 0
                self.view.layoutIfNeeded()
            }
            textField.resignFirstResponder()
        }
        return true
    }
}
