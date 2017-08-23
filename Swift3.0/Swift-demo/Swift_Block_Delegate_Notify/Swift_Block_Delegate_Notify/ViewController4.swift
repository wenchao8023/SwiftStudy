//
//  ViewController4.swift
//  Swift_Block_Delegate_Notify
//
//  Created by chao on 2017/4/13.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    // 通知名称常量
    let notifyChatMsgRecv = NSNotification.Name(rawValue: "notifyChatMesRecv")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "第四页"
        self.view.backgroundColor = UIColor.white
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .custom)
        button.frame = CGRect.init(x: 100, y: 100, width: 100, height: 40)
        button.setTitle("上一页", for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(lastClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func lastClick() {
        
        let userInfo: Dictionary = ["color" : UIColor.yellow, "num" : "4"] as [String : Any]
        
        NotificationCenter.default.post(name: notifyChatMsgRecv, object: nil, userInfo: userInfo)
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
//        NotificationCenter.default.removeObserver(self,
//                                                  name: notifyChatMsgRecv),
//                                                  object: nil)
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
