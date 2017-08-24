//
//  Person.swift
//  UILabelDemo
//
//  Created by chao on 2017/4/27.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

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
        
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        
        rangeOfThreeItems.firstValue = 6
        
        
//        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        
//        rangeOfFourItems.firstValue = 4
        
        
        
    }
//    init(dict: [NSObject: AnyObject]) {
//        height = dict["height"] as? Float
//    }
    
    // 析构函数
    deinit {
        print("xigou")
    }
}
