//
//  ViewController1.swift
//  Swift_Block_Delegate_Notify
//
//  Created by chao on 2017/4/13.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit
// 1.遵守协议
class ViewController1: UIViewController, TestDelegate {
    
    
    let vc2 = ViewController2()
    
    let vc3 = ViewController3()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "第一页"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .custom)
        button.frame = CGRect.init(x: 100, y: 100, width: 100, height: 40)
        button.setTitle("block", for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
        
        vc2.callBackBlock { (color, num) in
            self.view.backgroundColor = color
            print("接收到的数字是: \(num)")
        }
        
        let button2 = UIButton(type: .custom)
        button2.frame = CGRect.init(x: 100, y: 200, width: 100, height: 40)
        button2.setTitle("代理", for: .normal)
        button2.backgroundColor = UIColor.green
        button2.addTarget(self, action: #selector(delegateClick), for: .touchUpInside)
        self.view.addSubview(button2)
        
        vc3.myDelegate = self
        
        
        
        let button3 = UIButton(type: .custom)
        button3.frame = CGRect.init(x: 100, y: 300, width: 100, height: 40)
        button3.setTitle("通知", for: .normal)
        button3.backgroundColor = UIColor.green
        button3.addTarget(self, action: #selector(notifyClick), for: .touchUpInside)
        self.view.addSubview(button3)
        
//         接受通知 - method1
//        NotificationCenter.default.addObserver(
//            forName:NSNotification.Name(rawValue: "notifyChatMesRecv"),
//            object: nil,
//            queue: nil) { (notification) in
//                if let dic:Dictionary = notification.userInfo {
//                    
//                    let color: UIColor = dic["color"] as! UIColor
//                    let num: String = dic["num"] as! String
//                    
//                    self.view.backgroundColor = color
//                    print("接收到的数字是: \(num)")
//                }
//
//        }
        
        // 接受通知 - method2
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notifyMethod(notify:)),
                                               name: NSNotification.Name(rawValue: "notifyChatMesRecv"),
                                               object: nil)
        
        
        
        
        
        
        let button4 = UIButton(type: .custom)
        button4.frame = CGRect.init(x: 100, y: 400, width: 100, height: 40)
        button4.setTitle("单例", for: .normal)
        button4.backgroundColor = UIColor.green
        button4.addTarget(self, action: #selector(singleClick), for: .touchUpInside)
        self.view.addSubview(button4)
    }
    
    func singleClick() {
        
        self.navigationController?.pushViewController(ViewController5(), animated: true)
        self.view.backgroundColor = (UIApplication.shared.delegate as! AppDelegate).testColor
    }
    
    func notifyMethod(notify: NSNotification) {
        
        if let dic:Dictionary = notify.userInfo {
            
            let color: UIColor = dic["color"] as! UIColor
            let num: String = dic["num"] as! String
            
            self.view.backgroundColor = color
            print("接收到的数字是: \(num)")
        }
        
        print("notify.name is \(notify.name)\nnotify.obj is \(notify.object)")
    }
    
    
    
    func notifyClick() {
        
        self.navigationController?.pushViewController(ViewController4(), animated: true)
    }
    
    func delegateClick() {
        
        self.navigationController?.pushViewController(vc3, animated: true)
    }
    
    func delegateMethod1(result: UIColor, num: Int) {
        self.view.backgroundColor = result
        print("接收到的数字是: \(num)")
    }
    

    func buttonClick() {
        
        self.navigationController?.pushViewController(vc2, animated: true)
    }

    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name(rawValue: "notifyChatMesRecv"),
            object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
