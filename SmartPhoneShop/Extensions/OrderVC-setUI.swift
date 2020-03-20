//
//  OrderVC-setUI.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2020/01/04.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension OrderViewController {
    func setUI() {
        myBudgetDisplay.backgroundColor = .green
        myBudgetDisplay.textAlignment = .center
        myBudgetDisplay.text = "예산:  $\(SingletonData.shared.budget)"
        myBudgetDisplay.font = UIFont.boldSystemFont(ofSize: 25)
        
        amountToPayDisplay.backgroundColor = .blue
        amountToPayDisplay.text = "주문금액  $\(amountToPay)"
        amountToPayDisplay.textColor = .orange
        amountToPayDisplay.textAlignment = .center
        amountToPayDisplay.font = UIFont.boldSystemFont(ofSize: 25)
        
        orderButton.backgroundColor = .darkGray
        orderButton.setTitle("주문", for: .normal)
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        orderButton.layer.cornerRadius = 5
        orderButton.addTarget(self, action: #selector(didTapOrderButton(_:)), for: .touchUpInside)
        
        view.addSubview(myBudgetDisplay)
        view.addSubview(amountToPayDisplay)
        view.addSubview(orderButton)
    }
}
