//
//  ViewController.swift
//  TableViewTips
//
//  Created by chao on 2017/3/31.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    let testValue: NSString = "\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n"
    
    var statusDic:Dictionary <String, String> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.tableFooterView = UIView()

        // 自动适配 cell 的高度
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        

        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let lable = cell.contentView.viewWithTag(1000) as! UILabel
        
        lable.text = testValue as String    // NSString 作为 String使用的时候需要加 as String
        
        tableView.beginUpdates()
        
        print("row : " + String(indexPath.row) + "\t" + "count : " + String(statusDic.count));
        
        if statusDic[String(indexPath.row)] == "0" {
            lable.numberOfLines = 0
            statusDic[String(indexPath.row)] = "1"
        } else {
            lable.numberOfLines = 1
            statusDic[String(indexPath.row)] = "0"
        }
        tableView.endUpdates()
        
        return cell
    }

    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let att = [NSFontAttributeName:UIFont.systemFont(ofSize: 17)]
//        
//        return testValue.boundingRect(with: CGSize(width:300, height: 0), options: NSStringDrawingOptions(rawValue: 0), attributes: att, context: nil).size.height + 20
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        let label = cell?.contentView.viewWithTag(1000) as! UILabel
        
        if label.numberOfLines == 1 {
            label.numberOfLines = 0
            statusDic[String(indexPath.row)] = "0"
        } else {
            label.numberOfLines = 1
            statusDic[String(indexPath.row)] = "1"
        }
        
        tableView.reloadData()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

