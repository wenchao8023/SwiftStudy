//
//  FirstTableView.swift
//  Swift-MVVM(2)
//
//  Created by chao on 2017/4/24.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class FirstTableView: UITableView {
    
    var viewModel = FirstViewModel()
    

    override func awakeFromNib() {
        
        self.tableFooterView = UIView.init(frame: CGRect.zero)
        self.tableHeaderView = UIView.init(frame: CGRect.zero)
        
        self.estimatedRowHeight = 60
        self.rowHeight = UITableViewAutomaticDimension
        
        // 将 self 设置成 viewModel 的 target
        viewModel.target = self
        
        // 将 self 的代理 设置成 viewModel
        self.delegate = viewModel
        self.dataSource = viewModel
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
