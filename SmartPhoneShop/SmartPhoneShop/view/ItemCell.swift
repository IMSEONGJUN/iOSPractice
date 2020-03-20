//
//  ItemCell.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/27.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

class ItemCell: UITableViewCell {
    
    let itemImage = UIImageView()
    let itemName = UILabel()
    let itemCountLabel = UILabel()
    let itemPriceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    func setUI() {
        
        itemName.font = UIFont.boldSystemFont(ofSize: 20)
        itemCountLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        contentView.addSubview(itemImage)
        contentView.addSubview(itemName)
        contentView.addSubview(itemCountLabel)
        contentView.addSubview(itemPriceLabel)
    }
    
    func setConstraints() {
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        itemImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        itemImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        itemImage.widthAnchor.constraint(equalTo: itemImage.heightAnchor).isActive = true
        itemImage.contentMode = .scaleAspectFit
        
        itemName.translatesAutoresizingMaskIntoConstraints = false
        itemName.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 10).isActive = true
        itemName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        itemName.heightAnchor.constraint(equalTo: itemImage.heightAnchor).isActive = true
        itemName.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        itemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        itemPriceLabel.leadingAnchor.constraint(equalTo: itemName.trailingAnchor, constant: 15).isActive = true
        itemPriceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        itemPriceLabel.heightAnchor.constraint(equalTo: itemName.heightAnchor).isActive = true
        itemPriceLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        itemCountLabel.translatesAutoresizingMaskIntoConstraints = false
        itemCountLabel.leadingAnchor.constraint(equalTo: itemPriceLabel.trailingAnchor, constant: 5).isActive = true
        itemCountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        itemCountLabel.heightAnchor.constraint(equalTo: itemPriceLabel.heightAnchor).isActive = true
        itemCountLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setForProductList(item: Item) {
        self.itemImage.image = item.itemImage
        self.itemName.text = item.itemName
        self.itemPriceLabel.text = "$\(item.itemPrice)"
    }
    
    func setForShoppingBagList(item: Item) {
        self.itemImage.image = item.itemImage
        self.itemName.text = item.itemName
        self.itemPriceLabel.text = "$\(item.itemPrice)"
        self.itemCountLabel.text = "\(item.itemCount)"
    }
}
