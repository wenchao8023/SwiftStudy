//
//  ViewController.swift
//  SwiftExtension
//
//  Created by chao on 2017/5/4.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let str: String = "chao"
        str.printSelf()
        
        imgView.movetoXwithDuration(toX: 0, duration: 0.5)
        
        let intValue = 1
        print(intValue.FloatValue)
        print(intValue.DoubleValue)
        
//        imgView.image = UIImage(named: "翘臀女神芝芝10.jpg")!.imageCompress(targetWidth: 200)
        
        imgView.image = UIImage(named: "翘臀女神芝芝10.jpg")!.blurImage(value: 3.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

