//
//  ViewController.swift
//  UIButtonDemo
//
//  Created by chao on 2017/4/1.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.titleButton()
        self.imageButton()
        self.imageTitleButton()
        
    }
    
    //MARK: -文字按钮
    func titleButton() -> Void {
        //UIButton: UIControl: UIView
        //UIButton上有一个titleLabel专门负责按钮上文字的显示；有一个imageView专门负责按钮上图片的显示
        //=========UIView的属性和方法========
        //1.创建UIButton对象
        let titleBtn1 = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 50))
        //2.添加到界面上
        self.view.addSubview(titleBtn1)
        //3.设置背景颜色
        titleBtn1.backgroundColor = UIColor.black
        
        
        //1.创建UIButton对象
        let titleBtn2 = UIButton.init(frame: CGRect.init(x: 100, y: 160, width: 100, height: 50))
        //2.添加到界面上
        self.view.addSubview(titleBtn2)
        //3.设置背景颜色
        titleBtn2.backgroundColor = UIColor.black
        
        
        //1.创建UIButton对象
        let titleBtn3 = UIButton.init(frame: CGRect.init(x: 100, y: 220, width: 100, height: 50))
        //2.添加到界面上
        self.view.addSubview(titleBtn3)
        //3.设置背景颜色
        titleBtn3.backgroundColor = UIColor.black
        
        //1.创建UIButton对象
        let titleBtn4 = UIButton.init(frame: CGRect.init(x: 100, y: 280, width: 100, height: 50))
        //2.添加到界面上
        self.view.addSubview(titleBtn4)
        //3.设置背景颜色
        titleBtn4.backgroundColor = UIColor.black
        
        
        //=========UIButton专有的属性和方法======
        //1.设置按钮上显示的文字（给不同的状态设置不一样的文字）
        //参数1:想要在按钮上显示的文字
        //参数2:状态
        //Normal -> 正常状态(按钮正常显示，没有被点击或者按下的时候)
        //Highlighted ->高亮(按钮被按下，没有弹起来的时候的状态)
        //Selected -> 选中状态
        //Disabled -> 不可用状态(按钮不能被点击)
        titleBtn1.setTitle("正常", for: .normal)
        titleBtn2.setTitle("高亮", for: .highlighted)
        titleBtn3.setTitle("选中", for: .selected)
        titleBtn3.setTitleColor(UIColor.white, for: .selected)
        titleBtn4.setTitle("不可用", for: .disabled)
        titleBtn4.setTitleColor(UIColor.white, for: .disabled)
        
        
        //2.设置当前按钮是否选中(默认是false->非选中)
        titleBtn3.isSelected = true
        
        //3.设置当前按钮是否可用(默认是true->可用)
        titleBtn4.isEnabled = false
        
        //4.设置文字颜色(给不同的状态设置不一样的颜色)
        titleBtn1.setTitleColor(UIColor.yellow, for: .normal)
        titleBtn4.setTitleColor(UIColor.lightGray, for: .disabled)
        
        //5.设置按钮上的文字字体
        titleBtn1.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        //6.设置按钮上的文字的对齐方式
        titleBtn1.titleLabel?.textAlignment = .right
        
        //!!!7.给按钮添加事件
        //参数1:调用方法的对象
        //参数2:指定事件发生后参数1要去调用的方法(这个方法可以不带参，如果带参只能带一个，并且参数的类型是UIButton类型)，实参就是当前添加事件的按钮本身
        //参数3:事件
        //TouchDown -> 按下事件
        //功能:当按钮被按下的时候，self会去调用btnAction方法
        //TouchUpInside ->按下弹起事件
        //功能:当按钮被按下弹起来的时候，self会去调用btnAction方法
        titleBtn1.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        
    }
    
    func btnClick(btn:UIButton) -> Void {
        //CGFloat(arc4random()%256)/255
        //设置按钮的背景颜色是随机色
        btn.backgroundColor = UIColor.init(red: CGFloat(arc4random()%256)/255, green: CGFloat(arc4random()%256)/255, blue: CGFloat(arc4random()%256)/255, alpha: 1)
    }
    
    //MARK: -图片按钮
    func imageButton() -> Void {
        
        //1.创建一个按钮对象
        let imageBtn = UIButton.init(frame: CGRect.init(x: 100, y: 350, width: 60, height: 60))
        //2.添加到界面上
        self.view.addSubview(imageBtn)
        
        //3.设置图片
        //参数1:图片
        //参数2:状态(正常、高亮、选中、不可用)
        imageBtn.setBackgroundImage(UIImage.init(named: "AppIcon.png"), for: .normal)
        
        //4.添加按钮点击事件
        imageBtn.addTarget(self, action: #selector(imageBtnClick(btn:)), for: .touchUpInside)
    }
    
    func imageBtnClick(btn:UIButton) {
        print(btn.tag)
    }
    
    //MARK: -图片文字按钮
    func imageTitleButton() -> Void {
        //a.同时设置title和image属性，显示是图片在左，文字在右
        //b.同时设置title和groundImage，显示是图片在下层，文字在上层
        //1.创建一个按钮对象
        let button = UIButton.init(frame: CGRect.init(x: 100, y: 450, width: 80, height: 80))
        self.view.addSubview(button)
        
        //2.设置title
        button.setTitle("标题", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.backgroundColor = UIColor.black
        //3.设置图片
        button.setBackgroundImage(UIImage.init(named: "AppIcon.png"), for: .normal)
        
        //4.添加事件
        button.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        
        
        
        //a.同时设置title和image属性，显示是图片在左，文字在右
        //b.同时设置title和groundImage，显示是图片在下层，文字在上层
        //1.创建一个按钮对象
        let button2 = UIButton.init(frame: CGRect.init(x: 200, y: 450, width: 80, height: 80))
        self.view.addSubview(button2)
        
        //2.设置title
        button2.setTitle("标题", for: .normal)
        button2.setTitleColor(UIColor.red, for: .normal)
        button2.backgroundColor = UIColor.black
        //3.设置图片
        button2.setImage(UIImage.init(named: "AppIcon.png"), for: .normal)
        
        //4.添加事件
        button2.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

