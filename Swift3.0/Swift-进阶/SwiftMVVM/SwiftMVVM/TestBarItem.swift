//
//  TestBarItem.swift
//  SwiftMVVM
//
//  Created by chao on 2017/4/24.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class TestBarItem: UIBarButtonItem {

    
    
    var VM = TestBarItemViewModel()
    
    weak var controllerTarger: ViewController!
    
    
    override func awakeFromNib() {
        VM.target = self
        self.target = VM
        self.action = #selector(VM.testAction)
    }
}
