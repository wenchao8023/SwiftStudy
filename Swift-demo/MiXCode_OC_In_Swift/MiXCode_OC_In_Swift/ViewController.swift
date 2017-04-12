//
//  ViewController.swift
//  MiXCode_OC_In_Swift
//
//  Created by chao on 2017/4/12.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goFirst: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.green
    }

    @IBAction func goFirstAction(_ sender: Any) {
        
        let firVC: FirViewController = FirViewController()
//        firVC.transValue { (arg: String!) -> Void in
//            self.goFirst.setTitle(arg as String, for: .normal)
//        }
        
//        self.navigationController?.pushViewController(firVC, animated: true)
        self.present(firVC, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

