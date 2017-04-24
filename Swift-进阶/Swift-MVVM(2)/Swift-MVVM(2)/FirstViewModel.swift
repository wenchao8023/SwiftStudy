//
//  FirstViewModel.swift
//  Swift-MVVM(2)
//
//  Created by chao on 2017/4/24.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class FirstViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    var target: FirstTableView!     // 设置 viewModel 的 target
    
    var dataArray: Array<FirstModel?> = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCellID", for: indexPath)
        
                
        return cell
    }
}
