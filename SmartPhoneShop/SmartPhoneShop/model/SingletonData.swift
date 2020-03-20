//
//  SingletonData.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/27.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import Foundation
import UIKit

class SingletonData {
    static let shared = SingletonData()
    var pickedItems = [Item]()
    var budget = 0
    private init() {
        
    }
}
