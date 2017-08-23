//
//  ViewController3.swift
//  Swift_Block_Delegate_Notify
//
//  Created by chao on 2017/4/13.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

// 1.制定协议
@objc protocol TestDelegate: NSObjectProtocol {
    
    // 设置协议方法
    func delegateMethod1(result: UIColor, num: Int)
    
    
    @objc optional func optionalMethod()
}

class ViewController3: UIViewController {

    // 2.用weak定义代理
    weak var myDelegate: TestDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "第三页"
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .custom)
        button.frame = CGRect.init(x: 100, y: 100, width: 100, height: 60)
        button.setTitle("上一页", for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(lastClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    // 3.判断代理是否存在,让代理去执行方法
    func lastClick() {
       
        myDelegate?.delegateMethod1(result: UIColor.cyan, num: 3)
        self.navigationController?.popViewController(animated: true)
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
