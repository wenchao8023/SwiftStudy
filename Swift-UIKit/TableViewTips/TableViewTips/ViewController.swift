//
//  ViewController.swift
//  TableViewTips
//
//  Created by chao on 2017/4/1.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let testValue: NSString = "这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容"
    
    var dict:Dictionary<String, String> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.tableFooterView = UIView.init()
        
        // 使用约束来自动计算 cell 的高度，前提是 cell 中subView 一定要相对于上下进行约束
        // 也可以在代理中使用
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // 取消分割线
//        tableView.separatorStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
//        let label = cell.contentView.viewWithTag(1000) as! UILabel
//        
//        label.text = testValue as String
//        
//        if dict[String(indexPath.row)] == "0"{
//            label.numberOfLines = 0
//        } else {
//            label.numberOfLines = 1
//        }
        let bottomView = cell.contentView.viewWithTag(2000)
        let image = cell.contentView.viewWithTag(2001)
        
        let rect = bottomView?.convert((bottomView?.bounds)!, to: nil)
        
        var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
        
        Y *= 0.2
        
        if Y > 0 {
            Y = 0
        }
        
        if Y < -100 {
            Y = -100
        }
        
        image?.frame.origin.y = Y
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 获取到 indexPath 对应的 cell
        let cell = tableView.cellForRow(at: indexPath)
        
//        let lable = cell?.contentView.viewWithTag(1000) as! UILabel
//        
//        
//        /*
//         在 beginUpdates()
//             ...
//         和 endUpdates()
//         之间的 cell 会动画的的展示
//         */
//        tableView.beginUpdates()
//        if lable.numberOfLines == 0 {
//            lable.numberOfLines = 1
//            dict[String(indexPath.row)] = "1"
//        } else {
//            lable.numberOfLines = 0
//            dict[String(indexPath.row)] = "0"
//        }
//        tableView.endUpdates()
     
//        tableView.reloadData()
    }
    
    
    //MARK: --将[分割线]顶头
    override func viewDidLayoutSubviews() {
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.layoutMargins = UIEdgeInsets.zero
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
    //MARK: --将[分割线]顶头
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        // 根据字符串计算文本高度
//        let att = [NSFontAttributeName: UIFont.systemFont(ofSize: 17)]
//        return testValue.boundingRect(with: CGSize.init(width: 300, height: 0), options: .usesLineFragmentOrigin, attributes: att, context: nil).size.height + 20
        
        return 300
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for cell in tableView.visibleCells {
         
            let bottomView = cell.contentView.viewWithTag(2000)
            let image = cell.contentView.viewWithTag(2001)
            
            let rect = bottomView?.convert((bottomView?.bounds)!, to: nil)
            
            var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
            
            Y *= 0.2
            
            if Y > 0 {
                Y = 0
            }
            
            if Y < -100 {
                Y = -100
            }
            
            image?.frame.origin.y = Y
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

