//
//  ViewController.swift
//  SwiftMVVM
//
//  Created by chao on 2017/4/24.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController: UIViewController/*, UITableViewDelegate, UITableViewDataSource*/ {

    @IBOutlet weak var tableView: TestTableView!
    
    @IBOutlet weak var barItem: TestBarItem!
    
    deinit {
        print("ViewController Release")
    }
    
//    let testValue: NSString = "这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容"
//    
//    var dict:Dictionary<String, String> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        tableView.tableFooterView = UIView.init()
//        
//        // 使用约束来自动计算 cell 的高度，前提是 cell 中subView 一定要相对于上下进行约束
//        // 也可以在代理中使用
//        tableView.estimatedRowHeight = 60
//        tableView.rowHeight = UITableViewAutomaticDimension
        
        barItem.controllerTarger = self
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
//        
//        let bottomView = cell.contentView.viewWithTag(2000)
//        let image = cell.contentView.viewWithTag(2001)
//        
//        let rect = bottomView?.convert((bottomView?.bounds)!, to: nil)
//        
//        var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
//        
//        Y *= 0.2
//        
//        if Y > 0 {
//            Y = 0
//        }
//        
//        if Y < -100 {
//            Y = -100
//        }
//        
//        image?.frame.origin.y = Y
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        for cell in tableView.visibleCells {
//            
//            let bottomView = cell.contentView.viewWithTag(2000)
//            let image = cell.contentView.viewWithTag(2001)
//            
//            let rect = bottomView?.convert((bottomView?.bounds)!, to: nil)
//            
//            var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
//            
//            Y *= 0.2
//            
//            if Y > 0 {
//                Y = 0
//            }
//            
//            if Y < -100 {
//                Y = -100
//            }
//            
//            image?.frame.origin.y = Y
//        }
//    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

