//
//  UIViewController+Ext.swift
//  CollectionViewPractice
//
//  Created by SEONGJUN on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func markSelectedCheck(cell: UICollectionViewCell) {
        let containerView: UIView! = UIView(frame: cell.contentView.frame)
        containerView.backgroundColor = .darkGray
        containerView.alpha = 0.5
        
        let imageView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        imageView.tintColor = .white
        
        containerView.addSubview(imageView)
        containerView.bringSubviewToFront(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        if let imageView = cell.contentView.subviews.first as? UIImageView {
            imageView.addSubview(containerView)
        }
    }
}
