//
//  DetailVC-SetConstraints.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2020/01/04.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension DetailViewController {
    func setConstraints() {
        
        let paddle: CGFloat = 15
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        itemImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: paddle).isActive = true
        itemImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        itemImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: paddle).isActive = true
        itemNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: paddle).isActive = true
        itemNameLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        itemNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        itemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        itemPriceLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: paddle).isActive = true
        itemPriceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: paddle).isActive = true
        itemPriceLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        itemPriceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        itemCountLabel.translatesAutoresizingMaskIntoConstraints = false
        itemCountLabel.topAnchor.constraint(equalTo: itemPriceLabel.bottomAnchor, constant: paddle).isActive = true
        itemCountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: paddle).isActive = true
        itemCountLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        itemCountLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.topAnchor.constraint(equalTo: itemCountLabel.bottomAnchor, constant: paddle).isActive = true
        totalPriceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: paddle).isActive = true
        totalPriceLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        totalPriceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        itemNameDisplay.translatesAutoresizingMaskIntoConstraints = false
        itemNameDisplay.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: paddle).isActive = true
        itemNameDisplay.leadingAnchor.constraint(equalTo: itemNameLabel.trailingAnchor, constant: paddle).isActive = true
        itemNameDisplay.widthAnchor.constraint(equalToConstant: 250).isActive = true
        itemNameDisplay.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        itemPriceDisplay.translatesAutoresizingMaskIntoConstraints = false
        itemPriceDisplay.topAnchor.constraint(equalTo: itemNameDisplay.bottomAnchor, constant: paddle).isActive = true
        itemPriceDisplay.leadingAnchor.constraint(equalTo: itemPriceLabel.trailingAnchor, constant: paddle).isActive = true
        itemPriceDisplay.widthAnchor.constraint(equalToConstant: 250).isActive = true
        itemPriceDisplay.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        itemCountMinusButton.translatesAutoresizingMaskIntoConstraints = false
        itemCountMinusButton.topAnchor.constraint(equalTo: itemPriceDisplay.bottomAnchor, constant: paddle).isActive = true
        itemCountMinusButton.leadingAnchor.constraint(equalTo: itemCountLabel.trailingAnchor, constant: 60).isActive = true
        itemCountMinusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        itemCountMinusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        itemCountDisplay.translatesAutoresizingMaskIntoConstraints = false
        itemCountDisplay.topAnchor.constraint(equalTo: itemPriceDisplay.bottomAnchor, constant: paddle).isActive = true
        itemCountDisplay.leadingAnchor.constraint(equalTo: itemCountMinusButton.trailingAnchor, constant: 40).isActive = true
        itemCountDisplay.widthAnchor.constraint(equalToConstant: 50).isActive = true
        itemCountDisplay.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        itemCountAddButton.translatesAutoresizingMaskIntoConstraints = false
        itemCountAddButton.topAnchor.constraint(equalTo: itemPriceDisplay.bottomAnchor, constant: paddle).isActive = true
        itemCountAddButton.leadingAnchor.constraint(equalTo: itemCountDisplay.trailingAnchor, constant: 40).isActive = true
        itemCountAddButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        itemCountAddButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        totalPriceDisplay.translatesAutoresizingMaskIntoConstraints = false
        totalPriceDisplay.topAnchor.constraint(equalTo: itemCountMinusButton.bottomAnchor, constant: paddle).isActive = true
        totalPriceDisplay.leadingAnchor.constraint(equalTo: totalPriceLabel.trailingAnchor, constant: paddle).isActive = true
        totalPriceDisplay.widthAnchor.constraint(equalToConstant: 250).isActive = true
        totalPriceDisplay.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.topAnchor.constraint(equalTo: totalPriceLabel.bottomAnchor, constant: paddle).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        putInButton.translatesAutoresizingMaskIntoConstraints = false
        putInButton.topAnchor.constraint(equalTo: totalPriceDisplay.bottomAnchor, constant: paddle).isActive = true
        putInButton.leadingAnchor.constraint(equalTo: resetButton.trailingAnchor, constant: 60).isActive = true
        putInButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        putInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}
