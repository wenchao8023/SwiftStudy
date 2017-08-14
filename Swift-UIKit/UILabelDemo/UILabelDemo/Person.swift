//
//  Person.swift
//  UILabelDemo
//
//  Created by chao on 2017/4/27.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var _name: String?
    var _age:  Int?
    
    var name: String? {
        get {
            return _name
        }
        
        set {
            _name = newValue
        }
    }
    // 如果只实现 get 方法，则表示只读、也是计算型属性
    var age: Int? {
        get {
            return _age
        }
    }
    
    var height: Float?
    
    // 构造函数
    override init() {
        
    }
//    init(dict: [NSObject: AnyObject]) {
//        height = dict["height"] as? Float
//    }
    
    // 析构函数
    deinit {
        print("xigou")
    }
}
