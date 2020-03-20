//
//  DetailViewController.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/28.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let itemImageView = UIImageView()
    let itemNameLabel = UILabel()
    let itemNameDisplay = UILabel()
    let itemPriceLabel = UILabel()
    let itemPriceDisplay = UILabel()
    
    let itemCountLabel = UILabel()
    let itemCountDisplay = UILabel()
    let itemCountAddButton = UIButton()
    let itemCountMinusButton = UIButton()
    let totalPriceLabel = UILabel()
    let totalPriceDisplay = UILabel()
    
    let resetButton = UIButton()
    let putInButton = UIButton()
    
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = self.item.itemName
        setupUI()
        loadData()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setConstraints()
    }

    func loadData() {
        itemImageView.image = item.itemImage
        itemNameDisplay.text = item.itemName
        itemPriceDisplay.text = "$\(item.itemPrice)"
        itemCountDisplay.text = "\(item.itemCount)"
        totalPriceDisplay.text = "$" + String(item.itemPrice * item.itemCount)
    }
        
    @objc func didTapButton(_ sender: UIButton) {
        switch sender {
        case resetButton:
            item.itemCount = 0
            loadData()
        default:
            guard item.itemCount != 0 else {
                simpleAlert(message: "수량이 0 입니다")
                return
            }
            SingletonData.shared.pickedItems.append(item)
            customAlert(title: "알림",
                        message: "장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?",
                        firstActionTitle: "NO",
                        secondActionTitle: "MOVE",
                        completed1: {self.navigationController?.popViewController(animated: true)},
                        completed2: {self.item.itemCount = 0
                                     self.loadData()
                                     self.tabBarController?.selectedIndex = 1})
        }
    }
    
    @objc func didTapPlusAndMinus(_ sender: UIButton) {
        switch sender {
        case itemCountAddButton:
            guard item.itemCount < 30 else {return}
            item.itemCount += 1
            loadData()
        default:
            guard item.itemCount > 0 else {return}
            item.itemCount -= 1
            loadData()
        }
    }
}
