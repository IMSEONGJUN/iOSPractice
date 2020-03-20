//
//  DetailVC-SetUI.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2020/01/04.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension DetailViewController {
    func setupUI() {
        view.addSubview(itemImageView)
        view.addSubview(itemNameLabel)
        view.addSubview(itemNameDisplay)
        view.addSubview(itemPriceLabel)
        view.addSubview(itemPriceDisplay)
        view.addSubview(itemCountLabel)
        view.addSubview(itemPriceDisplay)
        view.addSubview(itemCountLabel)
        view.addSubview(itemCountDisplay)
        view.addSubview(itemCountAddButton)
        view.addSubview(itemCountMinusButton)
        view.addSubview(totalPriceLabel)
        view.addSubview(totalPriceDisplay)
        view.addSubview(resetButton)
        view.addSubview(putInButton)
        
        itemNameLabel.text = "상품명"
        itemPriceLabel.text = "가격"
        itemCountLabel.text = "수량"
        totalPriceLabel.text = "주문금액"
        resetButton.setTitle("초기화", for: .normal)
        putInButton.setTitle("담기", for: .normal)
        
        itemNameLabel.textAlignment = .right
        itemPriceLabel.textAlignment = .right
        itemCountLabel.textAlignment = .right
        totalPriceLabel.textAlignment = .right
        
        itemNameDisplay.textAlignment = .center
        itemPriceDisplay.textAlignment = .center
        itemCountDisplay.textAlignment = .center
        
        itemCountMinusButton.layer.cornerRadius = 15
        itemCountAddButton.layer.cornerRadius = 15
        itemCountMinusButton.backgroundColor = .blue
        itemCountAddButton.backgroundColor = .red
        itemCountMinusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        itemCountAddButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        itemCountMinusButton.setTitle("-", for: .normal)
        itemCountAddButton.setTitle("+", for: .normal)
        
        itemCountAddButton.addTarget(self, action: #selector(didTapPlusAndMinus(_:)), for: .touchUpInside)
        itemCountMinusButton.addTarget(self, action: #selector(didTapPlusAndMinus(_:)), for: .touchUpInside)
        
        resetButton.backgroundColor = .darkGray
        resetButton.layer.cornerRadius = 5
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        resetButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        putInButton.backgroundColor = .darkGray
        putInButton.layer.cornerRadius = 5
        putInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        putInButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
}
