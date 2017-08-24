//
//  Test1_ViewController.swift
//  FirstBlood
//
//  Created by chao on 2017/3/31.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class Test1_ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.createUI()
    }

    func createUI() -> Void {
        
        let redView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
        
        let yellowView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        yellowView.center = CGPoint.init(x: redView.frame.size.width / 2,
                                         y: redView.frame.size.height / 2)
        yellowView.backgroundColor = UIColor.yellow
        redView.addSubview(yellowView)
        
        
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
