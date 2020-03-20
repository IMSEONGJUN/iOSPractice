//
//  UIView+Ext.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/28.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(to superView: UILayoutGuide!) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView!.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView!.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView!.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView!.bottomAnchor).isActive = true
    }
}

