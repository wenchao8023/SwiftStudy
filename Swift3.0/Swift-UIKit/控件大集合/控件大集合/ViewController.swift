//
//  ViewController.swift
//  控件大集合
//
//  Created by chao on 2017/4/1.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView? = nil
    
    var selfWidth: CGFloat = 0.0
    
    var selfHeight: CGFloat = 0.0
    
    let showHeight: CGFloat = 0
    
    var dataArr: NSArray = []
    
    var subArr: NSArray = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "控件大集合"
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        selfWidth = self.view.bounds.size.width
        selfHeight = self.view.bounds.size.height
        
        dataArr = [
            "【开关】",
            "【滑动条】",
            "【进度条】",
            "【步数器】",
            "【多段选择视图】",
            "【活动指示框】",
            "【表单视图】",
            "【警告框】",
            "【文本视图】"]
        
        subArr = [
            "UISwitch",
            "UISlider",
            "UIProgressView",
            "UIStepper",
            "UISegmentControl",
            "UIActivityIndicatorView",
            "UIActionSheet",
            "UIAlertView",
            "UITextView"]
        
        self.createTableView()
    }
    
    /**
     创建tableView
     */
    func createTableView() -> Void {
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: selfWidth, height: (selfHeight - showHeight)))
        tableView?.dataSource = self
        tableView?.delegate = self
        self.view.addSubview(tableView!)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellid")
        
        if (cell == nil) {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellid")
        }
        
        cell?.textLabel?.text = dataArr[indexPath.row] as? String
        
        cell?.detailTextLabel?.text = subArr[indexPath.row] as? String
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc: DetailViewController? = DetailViewController()
        
        vc?.indexPath = indexPath as NSIndexPath?
        vc?.myTille = "\(self.dataArr[indexPath.row])-\(self.subArr[indexPath.row])";
        
        if indexPath.row == 6 {
            let alertControl = UIAlertController.init(title: "表单视图", message: "提示信息", preferredStyle: .actionSheet)
            
            let desvAction = UIAlertAction.init(title: "警告", style: .destructive, handler: { (_) in
                print("警告");
            })
            
            let alertAction1 = UIAlertAction.init(title: "确定1", style: .default) { (_) in
                print("确定1")
            }
            
            let alertAction5 = UIAlertAction.init(title: "确定4", style: .default) { (_) in
                print("确定4")
            }
            
            let alertAction3 = UIAlertAction.init(title: "确定2", style: .default) { (_) in
                print("确定2")
            }
            
            let alertAction4 = UIAlertAction.init(title: "确定3", style: .default) { (_) in
                print("确定3")
            }
            
            let alertAction2 = UIAlertAction.init(title: "取消", style: .cancel) { (_) in
                print("取消")
            }
            
            alertControl.addAction(desvAction);
            
            alertControl.addAction(alertAction1)
            
            alertControl.addAction(alertAction2)
            
            alertControl.addAction(alertAction3)
            
            alertControl.addAction(alertAction4)
            
            alertControl.addAction(alertAction5)
            
            self.present(alertControl, animated: true) {
                print("结束了")
            }
            
            return
        }
        
        if indexPath.row == 7 {
            let alertControl = UIAlertController.init(title: "警告框", message: "提示信息", preferredStyle: .alert)
            
            
            let alertAction1 = UIAlertAction.init(title: "确定1", style: .default) { (_) in
                print("确定1")
            }
            
            let alertAction5 = UIAlertAction.init(title: "确定4", style: .default) { (_) in
                print("确定4")
            }
            
            let alertAction3 = UIAlertAction.init(title: "确定2", style: .default) { (_) in
                print("确定2")
            }
            
            let alertAction4 = UIAlertAction.init(title: "确定3", style: .default) { (_) in
                print("确定3")
            }
            
            let alertAction2 = UIAlertAction.init(title: "取消", style: .cancel) { (_) in
                print("取消")
            }
            
            alertControl.addAction(alertAction1)
            
            alertControl.addAction(alertAction2)
            
            alertControl.addAction(alertAction3)
            
            alertControl.addAction(alertAction4)
            
            alertControl.addAction(alertAction5)
            
            self.present(alertControl, animated: true) {
                print("结束了")
            }
            
            return
        }
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
    func createMView(indexPath: NSIndexPath) -> Void {
        print(indexPath.row)
        
        let UIClass: AnyClass = NSClassFromString((subArr[indexPath.row] as? String)!)!
        
        guard let classType = UIClass as? UIView.Type else {
            print("字符串转对象失败")
            
            return
        }
        
        let subView = classType.init()
        
        subView.frame = CGRect.init(x: 20, y: 40, width: 200, height: 200)
        
        self.view.addSubview(subView)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

