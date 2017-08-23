//
//  LazyClass.swift
//  UILabelDemo
//
//  Created by chao on 2017/4/27.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class LazyClass: NSObject {
    
    lazy var array : [String] = {
        () -> [String] in
        return ["why", "lmj", "lnj"]
    }()
}
