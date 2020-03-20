//
//  OrderViewController.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/30.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    let myBudgetDisplay = UILabel()
    let amountToPayDisplay = UILabel()
    let orderButton = UIButton()
    
    var amountToPay = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setUI()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setConstraints()
    }
    
    @objc func didTapOrderButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.orderButton.alpha = 0.5
            self.orderButton.alpha = 1
        }
        if SingletonData.shared.budget >= self.amountToPay {
            orderWhenPossibleCase()
        }
        else {
            simpleAlert(message: "예산이 부족합니다")
        }
    }
    deinit {
        print("OrderVC deinit")
    }
    
    func orderWhenPossibleCase() {
        let alert = UIAlertController(title: "주문확인", message: "주문금액은 $\(self.amountToPay) 입니다", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            SingletonData.shared.budget -= self.amountToPay
            self.amountToPay = 0
            self.amountToPayDisplay.text = "\(self.amountToPay)"
            self.myBudgetDisplay.text = String(SingletonData.shared.budget)
            SingletonData.shared.pickedItems.removeAll()
            
            let alert = UIAlertController(title: "알림", message: "주문이 완료되었습니다", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default){ (_) in
                self.navigationController?.popViewController(animated: true)
                //self.tabBarController?.selectedIndex = 0
            }
            alert.addAction(ok)
            self.present(alert,animated: true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
}
