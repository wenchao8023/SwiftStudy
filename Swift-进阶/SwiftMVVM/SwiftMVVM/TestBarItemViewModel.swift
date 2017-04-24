//
//  TestBarItemViewModel.swift
//  SwiftMVVM
//
//  Created by chao on 2017/4/24.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class TestBarItemViewModel: NSObject {

    weak var target: TestBarItem!
    
    
    func testAction() -> Void {
        print("click item")
        
//        let vc = SecondViewController()
//        target.controllerTarger.navigationController?.pushViewController(vc, animated: true)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "test")
        target.controllerTarger.navigationController?.pushViewController(vc, animated: true)
    }
}
