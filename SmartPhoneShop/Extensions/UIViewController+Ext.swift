//
//  UIViewController+Ext.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2020/01/21.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
    
    func simpleAlert(title: String = "알림", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(ok)
        present(alert,animated: true)
    }
    
    func customAlert(title: String, message: String, firstActionTitle: String, secondActionTitle: String = "", completed1: @escaping ()->Void, completed2: @escaping ()->Void = {}) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: firstActionTitle, style: .default){ (_) in
            completed1()
        }
        let secondAction = UIAlertAction(title: secondActionTitle, style: .default) { (_) in
            completed2()
        }
        if firstActionTitle != "" { alert.addAction(firstAction) }
        if secondActionTitle != "" { alert.addAction(secondAction) }
        present(alert, animated: true)
    }
    
    func fetchData() -> [Item] {
        let item1 = Item(itemImage: UIImage(named: "applewatch5")!, itemName: "Apple Watch", itemPrice: 50, itemCount: 0, stock: 10)
        let item2 = Item(itemImage: UIImage(named: "ipadAir3")!, itemName: "iPad", itemPrice: 30, itemCount: 0, stock: 10)
        let item3 = Item(itemImage: UIImage(named: "ipadPro")!, itemName: "iPad Pro", itemPrice: 70, itemCount: 0, stock: 10)
        let item4 = Item(itemImage: UIImage(named: "iphone4s")!, itemName: "iPhone4S", itemPrice: 20, itemCount: 0, stock: 10)
        let item5 = Item(itemImage: UIImage(named: "iphone6s")!, itemName: "iPhone6S", itemPrice: 50, itemCount: 0, stock: 10)
        let item6 = Item(itemImage: UIImage(named: "iphone7")!, itemName: "iPhone7", itemPrice: 50, itemCount: 0, stock: 10)
        let item7 = Item(itemImage: UIImage(named: "iphone11pro")!, itemName: "iPhone11 Pro", itemPrice: 90, itemCount: 0, stock: 10)
        let item8 = Item(itemImage: UIImage(named: "iphoneX")!, itemName: "iPhoneX", itemPrice: 90, itemCount: 0, stock: 10)
        let item9 = Item(itemImage: UIImage(named: "iphoneXR")!, itemName: "iPhoneXR", itemPrice: 70, itemCount: 0, stock: 10)
        
        return [item1, item2, item3, item4, item5, item6, item7, item8, item9]
    }
    
}
