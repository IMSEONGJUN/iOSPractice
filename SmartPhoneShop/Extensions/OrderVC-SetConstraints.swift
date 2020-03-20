//
//  OrderVC-SetConstraints.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2020/01/04.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension OrderViewController {
    func setConstraints() {
           myBudgetDisplay.translatesAutoresizingMaskIntoConstraints = false
           myBudgetDisplay.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
           myBudgetDisplay.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
           myBudgetDisplay.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100).isActive = true
           myBudgetDisplay.heightAnchor.constraint(equalToConstant: 50).isActive = true
           
           amountToPayDisplay.translatesAutoresizingMaskIntoConstraints = false
           amountToPayDisplay.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
           amountToPayDisplay.topAnchor.constraint(equalTo: myBudgetDisplay.bottomAnchor, constant: 30).isActive = true
           amountToPayDisplay.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100).isActive = true
           amountToPayDisplay.heightAnchor.constraint(equalToConstant: 50).isActive = true
           
           orderButton.translatesAutoresizingMaskIntoConstraints = false
           orderButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
           orderButton.topAnchor.constraint(equalTo: amountToPayDisplay.bottomAnchor, constant: 30).isActive = true
           orderButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100).isActive = true
           orderButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
       }

}
