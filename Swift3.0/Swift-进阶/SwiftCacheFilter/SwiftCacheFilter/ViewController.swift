//
//  ViewController.swift
//  SwiftCacheFilter
//
//  Created by chao on 2017/5/4.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

/// 文件缓存操作
// 查询文件目录
// 循环计算项目缓存
// 清除文件缓存
class ViewController: UIViewController {

    @IBOutlet weak var cacheLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func readCache(_ sender: Any) {
        self.cacheLabel.text = XCache.returnCacheSize() + " MB"
        
        
    }
    @IBAction func clearCache(_ sender: Any) {
        
        XCache.cleanCache()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

