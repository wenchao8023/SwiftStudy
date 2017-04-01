//
//  ViewController.swift
//  UIImageVIewDemo
//
//  Created by chao on 2017/3/31.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //UIImageView 的基本属性
        self.baseParas()
        
        //UIImageView 帧动画
        self.UIImageViewAnimation()
        
    }
    
    //MARK: -UIImageView 帧动画
    func UIImageViewAnimation() -> Void {
     
        self.createImageView()
        
        //创建一个定时器，并且自动开启
        //参数1:定时时间
        //参数2:调用方法的对象
        //参数3:存储定时时间到了以后需要调用的方法(可以不带参也可以带参，但是如果带参只能带一个参，并且参数类型是NSTimer类型)
        //参数4:给当前的NSTimer的userInfo属性赋的值(一般写nil)
        //参数5:是否重复
        //功能:每隔0.1秒，self去调用一次timerAction方法
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeAction), userInfo: "aaa", repeats: true)
    }
    
    func timeAction(timer: Timer) -> Void {
        print("userInfo is : \(timer.userInfo)")
        
        let imageView = self.view.viewWithTag(110) as! UIImageView
        
        
        
        //判断图像是否到屏幕边缘
//        if imageView.frame.origin.x >= self.view.bounds.width - imageView.bounds.width {
//            // 暂停定时器
//            timer.fireDate = Date.distantFuture
//        } else {
//            // 恢复定时器
//            timer.fireDate = Date.distantPast
//        }
        //判断图像是否到屏幕右边缘
        if imageView.frame.origin.x >= self.view.bounds.width - imageView.bounds.width {
            imageView.frame.origin.y += 3
            
            return
        }
        
        //判断图像是否到屏幕下边缘
        if imageView.frame.origin.y <= self.view.bounds.height - imageView.bounds.height {
            imageView.frame.origin.x -= 2
            
            return
        }
        
        //判断图像是否到屏幕左边缘
        if imageView.frame.origin.x <= 0 {
            imageView.frame.origin.y -= 3
            
            return
        }
        
        //判断图像是否到屏幕上边缘
        if imageView.frame.origin.y <= 0 {
            imageView.frame.origin.x += 2
            
            return
        }
        
        imageView.frame.origin.x += 2
    }
    
    
    func createImageView() -> Void {
        
        //1.创建一个UIImageView对象
        //通过图片去创建一个imageView;UIImageView的大小是图片的大小，坐标是(0,0)
        let imageView = self.view.viewWithTag(110) as! UIImageView
        
        imageView.frame.size = CGSize.init(width: 60, height: 100)
        
        //3.使用UIImageView播放帧动画
        //a.设置帧动画数组
        //创建一个空的图片数组
        var imageArr = [UIImage]()
        //通过 for 循环创建图片数组
        for item in 0...28 {
            //拼接图片名
            let imageName = "refresh\(item).png"
            //创建对应的图片
            let image = UIImage.init(named: imageName)
            //将图片存到数组中
            imageArr.append(image!)
        }
        
        imageView.animationImages = imageArr
        
        //b.设置动画时间，单位秒
        imageView.animationDuration = 3.0
        
        //c.设置动画重复的次数（默认是0 -> 无限循环）
        imageView.animationRepeatCount = 0
        
        //d.开始动画
        imageView.startAnimating()
    }
    
    //MARK: -UIImageView 的基本属性
    func baseParas() -> Void {
        //UIImageView:UIView
        //==========UIView的属性和方法==========
        //1.创建UIImageView对象
        let imageV = UIImageView.init(frame: CGRect.init(x: 50, y: 100, width: 300, height: 500))
        //2.添加到界面上
        self.view.addSubview(imageV)
        //3.设置背景颜色
        imageV.backgroundColor = UIColor.black
        imageV.tag = 110
        
        //=========UImageView专有属性=========
        //1.image属性
        //a.通过图片名去创建一个图片对象(注意:如果图片的格式是png，那么图片名的后缀可以省略。但是其他格式的图片的图片名的后缀不能省略)
        imageV.image = UIImage.init(named: "泰迪熊MM6.jpg")
        
        //b.通过图片路径去创建一个图片对象
        //将文件(除了swift文件)放到工程中，实质是放到了当前应用程序的包文件中
        //（想要拿到工程中的图片路径先要获取包文件;）
        //拿到包中的指定的文件的路径
        
        self.perform(#selector(changeImage), with: nil, afterDelay: 2)
    }
    
    func changeImage() -> Void {
        
        let imageV = self.view.viewWithTag(110) as! UIImageView
        let imagePath = Bundle.main.path(forResource: "泰迪熊MM7", ofType: "jpg")
        imageV.image = UIImage.init(contentsOfFile: imagePath!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

