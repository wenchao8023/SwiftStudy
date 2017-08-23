//
//  MainTabBar.swift
//  UITabBardemo
//
//  Created by chao on 2017/4/28.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let vc1 = ViewController1()
        let vc2 = ViewController2()
        let vc3 = ViewController3()
        let vc4 = ViewController4()
        
        self.viewControllers = [vc1, vc2, vc3, vc4]
        
        
        let vc1tbb = UITabBarItem.init(title: "消息", image: UIImage.init(named: "video"), selectedImage: UIImage.init(named: "video_hover"))
     
        let vc2tbb = UITabBarItem.init(title: "工作", image: UIImage.init(named: "video"), selectedImage: UIImage.init(named: "video_hover"))

        let vc3tbb = UITabBarItem.init(title: "联系人", image: UIImage.init(named: "User"), selectedImage: UIImage.init(named: "User_hover"))
 
        let vc4tbb = UITabBarItem.init(title: "我的", image: UIImage.init(named: "User"), selectedImage: UIImage.init(named: "User_hover"))
        
//        vc1tbb.setBadgeTextAttributes(attribute, for: .selected)
        
        
        self.tabBar.items?.append(vc1tbb)
        self.tabBar.items?.append(vc2tbb)
        self.tabBar.items?.append(vc3tbb)
        self.tabBar.items?.append(vc4tbb)
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
