//
//  TestTableView.swift
//  SwiftMVVM
//
//  Created by chao on 2017/4/24.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class TestTableView: UITableView {
    var VM = TestTableViewModel()
    
    override func awakeFromNib() {
        
        self.tableFooterView = UIView.init()
        
        // 使用约束来自动计算 cell 的高度，前提是 cell 中subView 一定要相对于上下进行约束
        // 也可以在代理中使用
        self.estimatedRowHeight = 60
        self.rowHeight = UITableViewAutomaticDimension
        VM.target = self
        self.delegate = VM
        self.dataSource = VM
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
