//
//  ViewController.swift
//  UIViewDemo
//
//  Created by chao on 2017/3/31.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - 属性
    let subView = UIView.init()
    let subView2: UIView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //UIView 的父子视图
//        self.UIViewSuperAndChild()
        
        //视图的层次关系
//        self.layerOfUIView()
        
        //UIView 动画
        self.ViewAnimation()
        
    }
    
    //MARK: - UIView 动画
    func ViewAnimation() -> Void {
        
        //创建视图
        subView.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        subView.center = self.view.center
        subView.backgroundColor = UIColor.black
        self.view.addSubview(subView)
        
        //切圆角
        self.layerAction()
        
//        self.startViewAnimation1()
        
        self.startViewAnimation2()

//        self.startViewAnimation3()
        
//        self.startViewAnimation4()
    }
    //MARK: -- Layer属性
    func layerAction() -> Void {
        //layer属性是负责视图的形状(显示)
        
        //1.切圆角
        //当圆角的值为正方形的宽的一半，就可以切一个圆
        self.subView.layer.cornerRadius = 50
        self.subView.layer.borderColor = UIColor.red.cgColor
        self.subView.layer.borderWidth = 3
    }
    //MARK: -- 动画方法
    func startViewAnimation4() -> Void {
        
        //参数1:动画时间
        //参数2:延迟时间
        //参数3:弹簧的压力系数
        //参数4:弹簧初始的加速度
        //参数5:选项
        //参数6:设置动画结束时视图的状态
        //参数7:动画结束后要执行的闭包
        UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: [ .repeat, .autoreverse], animations: { 
            //注意:对于有圆角的视图，改变大小而又不影响形状，只能通过形变去缩放。不能直接改变frame中的size
            self.subView.transform = CGAffineTransform.init(translationX: -100, y: -100)
        }, completion: nil)
    }
    
    //MARK: -- 动画方法
    func startViewAnimation1() -> Void {
        
        //功能:执行这个方法前视图的状态，动画的切换到闭包里面设置的最终状态
        //参数1:动画时间（单位:秒）
        //参数2:闭包，设置动画结束时视图的状态
        UIView.animate(withDuration: 2) { 
            //在这儿来设置视图动画结束时的状态
            //a.动画的改变视图的坐标
            self.subView.frame.origin.y = 50
            
            //b.动画的改变视图的大小
            //self.subView.frame.size = CGSizeMake(50, 50)
            self.subView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            
            //c.动画的改变视图的背景颜色
            self.subView.backgroundColor = UIColor.red
            
            //d.动画的改变视图的透明度(0~1)
            self.subView.alpha = 0.3
        }
    }
    //MARK: -- 动画方法
    func startViewAnimation2() -> Void {
        
        //参数3:整个动画完成后会自动调用这个闭包
        UIView.animate(withDuration: 1.5, animations: {
            self.subView.transform = CGAffineTransform.init(translationX: -100, y: -100)
            self.subView.layer.borderWidth = 0
            self.subView.transform = CGAffineTransform.init(scaleX: 0.2, y: 0.2)
        }) { (_) in
            
            //写动画结束后需要执行的代码
            UIView.animate(withDuration: 1, animations: { 
                self.subView.transform = CGAffineTransform.init(translationX: 100, y: 0)
                self.subView.transform = CGAffineTransform.init(scaleX: 10, y: 10)
            }, completion: { (_) in
                
                UIView.animate(withDuration: 1, animations: {
                    self.subView.transform = CGAffineTransform.init(scaleX: 2, y: 2)
                    self.subView.alpha = 0;
                })
            })
        }
    }
    //MARK: -- 动画方法
    func startViewAnimation3() -> Void {
        
        //参数1:动画时间
        //参数2:延迟时间
        //参数3:弹簧的压力系数
        //参数4:弹簧初始的加速度
        //参数5:选项
        //参数6:设置动画结束时视图的状态
        //参数7:动画结束后要执行的闭包
        UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: [ .repeat, .autoreverse], animations: {
            //注意:对于有圆角的视图，改变大小而又不影响形状，只能通过形变去缩放。不能直接改变frame中的size
            self.subView.transform = CGAffineTransform.init(translationX: -100, y: -100)
        }, completion: nil)
    }
    
    //MARK: - 视图的层次关系
    func layerOfUIView() -> Void {
        //结论:在一个视图上，添加多个子视图的时候，子视图之间如果有公共的部分。那么后添加的子视图会覆盖先添加的
        //1.一般情况下，如果想要将一个视图显示在最下面，就最先添加。想要显示在最上面就最后添加
        //创建视图
        let view1 = self.createView(frame: CGRect.init(x: 50, y: 100, width: 100, height: 100),
                                    bgColor: UIColor.yellow)
        
        let view2 = self.createView(frame: CGRect.init(x: 100, y: 150, width: 100, height: 100),
                                    bgColor: UIColor.red)
        
        let view3 = self.createView(frame: CGRect.init(x: 150, y: 200, width: 100, height: 100),
                                    bgColor: UIColor.green)
        
        let view4 = self.createView(frame: CGRect.init(x: 180, y: 130, width: 100, height: 100),
                                    bgColor: UIColor.purple)
        
        //2.将指定的视图放到最上层
        self.view.bringSubview(toFront: view1)
        
        //3.将指定的视图放到最下层
        self.view.sendSubview(toBack: view2)
        
        //4.将指定的视图插入到另一个视图的上面
        self.view.insertSubview(view2, aboveSubview: view3)
        
        //5.将指定的视图插入到另外一个视图的下面
        self.view.insertSubview(view2, belowSubview: view1)
        
        //6.将指定的视图插入指定的层
        self.view.insertSubview(view4, at: 3)
        
    }
    
    func createView(frame:CGRect, bgColor:UIColor) -> UIView {
        //创建视图对象
        let subView = UIView.init(frame: frame)
        //设置背景颜色    
        subView.backgroundColor = bgColor
        //添加到界面上
        self.view.addSubview(subView)
        //将创建的视图返回
        return subView
    }
    

    //MARK: - UIView 的父子视图
    func UIViewSuperAndChild() -> Void {
        //1.创建一个UIView对象
        let redView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 200))
        //2.设置背景颜色
        redView.backgroundColor = UIColor.red
        
        //3.添加到界面上
        //self.view就是redView的父视图，redView就是self.view的子视图
        self.view.addSubview(redView)
        
        //4.设置tag值,默认都是0.设tag值的时候值必须要大于0
        //tag的作用是用来区分界面上不同的视图
        redView.tag = 100
        
        //MARK: - 父子视图的特点和方法
        //再创建一个黄色视图
        let yellowView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        yellowView.backgroundColor = UIColor.yellow
        yellowView.tag = 101
        
        //1.一个视图只有一个父视图，可以有多个子视图
        //连续将同一个视图添加到两个视图上，最后一次添加有效
        redView.addSubview(yellowView)
        self.view.addSubview(yellowView)
        
        //2.获取一个视图的父视图
        let superView = redView.superview
        superView?.backgroundColor = UIColor.green
        
        //3.获取一个视图的所有的子视图
        let subViews = self.view.subviews
        //拿到所有的子视图中的红色视图和黄色视图
        //a.
        for item in subViews {
            
            //判断item是否是UILabel类型的。如果是就返回true,如果不是就返回false
            if item.isKind(of: UILabel.superclass()!) {
                print(item)
            }
        }
        
        for item in subViews {
            
            if item.tag == 100 {
                print("红色视图")
                //将红色视图的背景颜色变成橙色
                item.backgroundColor = UIColor.orange
            }
            
            if item.tag == 101 {
                
                print("黄色视图\(item)")
            }
        }
        
        //4.通过tag值拿到指定的子视图
        let subView2 = self.view.viewWithTag(101)
        subView2?.frame.origin.y = 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

