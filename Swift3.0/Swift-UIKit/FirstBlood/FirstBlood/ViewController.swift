//
//  ViewController.swift
//  FirstBlood
//
//  Created by chao on 2017/3/31.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //创建一个视图对象
        let redView = UIView.init()
        //添加到界面上
        self.view.addSubview(redView)
        //设置背景颜色
        redView.backgroundColor = UIColor.red
        //1.frame
        redView.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        //2.center
        print("center : " + NSStringFromCGPoint(redView.center))
        
        redView.center = CGPoint.init(x: 200, y: 200)
        print("center : " + NSStringFromCGPoint(redView.center))
        
        //3.bounds
        /* Tips
         *  如果bounds的大小，frame的大小和坐标都改变，center不变
         */
        print("bounds : " + NSStringFromCGRect(redView.bounds))
        
        redView.bounds = CGRect.init(x: 0, y: 0, width: 150, height: 150)
        print("center : " + NSStringFromCGPoint(redView.center))
        

        let yellowView = UIView.init(frame: CGRect.init(x: 10, y: 10, width: 40, height: 40))
        yellowView.backgroundColor = UIColor.yellow
        redView.addSubview(yellowView)
        
        
        //4.transform(形变)
        //当前视图发生形变，那么添加到当前视图上的所有的视图会跟着一起形变
        //a.缩放
        //参数1:x方向上的缩放比例
        //参数2:y方向上的缩放比例
        redView.transform = CGAffineTransform.init(scaleX: 0.8, y: 2.5)
        
        //b.旋转
        //参数:旋转角度(圆周率对应的角度值)
//        redView.transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI_4 / 2))
        redView.transform = CGAffineTransform.init(rotationAngle: .pi / 8)
        
        //c.平移
        //参数1:在x方向上平移的距离，负值->向左移，正值->向右移
        //参数2:在y方向上平移的距离，负值->向上移，正值->向下移
        redView.transform = CGAffineTransform.init(translationX: 0, y: 300)
        
        //d.多个形变同时发生
        //在另外一个形变的前提下旋转
        //参数1:另外一个形变
        //参数2:旋转角度
        redView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5).rotated(by: CGFloat(M_PI_4 / 2))
        
        //在另外一个形变的前提下平移
        redView.transform = redView.transform.translatedBy(x: 0, y: 300)
        
        //在另外一个形变的前提下缩放
        //创建一个平移的形变
        let transLation = CGAffineTransform(translationX: 100, y: 0)
        redView.transform = transLation.scaledBy(x: 0.5, y: 2)
        
        //组合两个形变
        //旋转形变
        let rotate = CGAffineTransform(rotationAngle: 0.2)
        //平移形变
        let transLation1 = CGAffineTransform(translationX: 100, y: 100)
        //将旋转形变和平移形变组合
        redView.transform = rotate.concatenating(transLation1)
        
        
        let tapOne = UITapGestureRecognizer.init(target: self, action: #selector(goTestView))
        redView.addGestureRecognizer(tapOne)
        
        
        
        //UIView 解读
        self.viewRead()
        
    }

    func goTestView() -> Void {
        self.navigationController?.pushViewController(Test1_ViewController.init(), animated: true)
        
    }
    
    func viewRead() -> Void {
        
        //UIView:是iOS中所有视图(控件)直接/间接的父类；所以UIView的属性和方法，对于其他类型的视图都有效
        //视图:在屏幕上能看见的所有的东西都属于视图
        
        //1.创建UIView的对象
        let redView = UIView.init()
        
        //想要将视图展示在屏幕上的两个必要条件:
        //a.必须设置坐标和大小（默认坐标是(0,0),大小(0,0)）
        //b.将视图添加到已经展示在屏幕上的视图上
        
        //2.设置frame属性(由坐标(x,y)和大小(width,height)两个部分组成)
        redView.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        //iOS中所有的结构体都有一个对应的Make方法用来快速的创建一个结构体变量
        redView.frame = CGRect.init(x: 10, y: 10, width: 100, height: 100)
        
        //4.设置背景颜色
        //视图的背景颜色默认是透明色
        //颜色的创建方式:
        
        //b.通过三原色来创建颜色
        //CGFloat就是UI中的浮点型
        //参数1，2，3: 红、绿、蓝的值（0~1） 0/255 ~ 255/255
        //参数4: 透明度（0~1）
        redView.backgroundColor = UIColor.init(red: 30/255.0, green: 133/255.0, blue: 26/255.0, alpha: 1)
        
        //c.创建灰色
        redView.backgroundColor = UIColor.init(white: 0.8, alpha: 1)
        
        //通过类型方法创建指定颜色
        redView.backgroundColor = UIColor.red
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

