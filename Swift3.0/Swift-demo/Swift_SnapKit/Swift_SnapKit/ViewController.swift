//
//  ViewController.swift
//  Swift_SnapKit
//
//  Created by chao on 2017/8/24.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    let slider = UISlider()
    
    lazy var box = UIView()
    
    var scacle: Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        /**
         *  帮朋友做的一个鶸需求
         */
        self.slider.addTarget(self, action: #selector(showValueChange(slider:)), for: .valueChanged)
        self.view.addSubview(self.slider)
        
        self.slider.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(20)
            make.center.equalTo(self.view)
        }
        
        self.slider.minimumValue = 0
        self.slider.maximumValue = 10000
        
        self.slider.value = 5000
        
        
        let leftLabel = UILabel()
        leftLabel.textAlignment = .center
        self.view.addSubview(leftLabel)
        
        leftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.slider.snp.bottom).inset(-20)
            make.left.equalTo(self.slider.snp.left).inset(-30)
            make.size.equalTo(CGSize(width: 60, height: 20))
        }
        
        leftLabel.text = "1000"
        
        
        let centerLable = UILabel()
        centerLable.textAlignment = .center
        self.view.addSubview(centerLable)
        
        centerLable.snp.makeConstraints { (make) in
            make.top.equalTo(self.slider.snp.bottom).inset(-20)
            make.centerX.equalTo(self.slider)
            make.size.equalTo(CGSize(width: 60, height: 20))
        }
        
        centerLable.text = "5000"
        
        
        let rightLabel = UILabel()
        rightLabel.textAlignment = .center
        self.view.addSubview(rightLabel)
        
        rightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.slider.snp.bottom).inset(-20)
            make.right.equalTo(self.slider.snp.right).inset(-30)
            make.size.equalTo(CGSize(width: 60, height: 20))
        }
        
        rightLabel.text = "10000"
        
        let showLabel = UILabel()
        showLabel.textAlignment = .center
        showLabel.tag = 110
        self.view.addSubview(showLabel)
        
        showLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.slider)
            make.bottom.equalTo(self.slider).inset(40)
            make.size.equalTo(CGSize(width: 60, height: 20))
        }
        

        /**
         *  这里来看看 snap 的用法
         */
        
        for subView in self.view.subviews {
            subView.removeFromSuperview()
        }
        
        
//        self.snapUse1()
        
//        self.snapUpdate()
        
        self.snapPriority()
        
        /**
         到这里就基本可以完成大部分的视图需求了
         用 swift 也可以愉快的编程了
         */
        
    }

    
    
    func showValueChange(slider: UISlider) -> Void {
        
        let showLable = self.view.viewWithTag(110) as? UILabel
        
        let value = slider.value
        
        var showValue: Float = 0
        
        if value < 5000 {
            showValue = value * 4 / 5 + 1000
        }
        else
        {
            showValue = value
        }
        
        showLable?.text = String(Int(showValue))
    }
    
    //MARK: - 1. 基本用法
    /**
     通过snp.makeConstraints方法给view添加约束
     
     约束：边距，宽，高，左右上下距离，基准线。
     
     同时，添加过约束后可以修正，修正有位移修正（inset、offset）和倍率修正（multipliedBy）
     
     inset  约束值对应的是 负数
     
     offset 约束值对应的是 正数
     
     语法一般是： make.equalTo 或 make.greaterThanOrEqualTo 或 make.lessThanOrEqualTo + 倍数和位移修正。
     
     .equalTo：等于
     
     .lessThanOrEqualTo：小于等于
     
     .greaterThanOrEqualTo：大于等于
     
     注意： 使用snp.makeConstraints方法的元素必须事先添加到父元素的中，例如：self.view.addSubview(view)
     */
    func snapUse1() {
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.cyan
        self.view.addSubview(view1)
        
        view1.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 60, left: 40, bottom: 20, right: 40))
        }
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.blue
        view1.addSubview(view2)
        
        view2.snp.makeConstraints { (make) in
            make.top.equalTo(view1)
            make.left.equalTo(view1)
            make.width.equalTo(view1)
            make.height.equalTo(100)
        }
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.yellow
        view2.addSubview(view3)
        
        view3.snp.makeConstraints { (make) in
            make.top.left.height.equalTo(view2)
            make.width.equalTo(view2).multipliedBy(0.5)
        }
        
        
        let view4 = UIView()
        view4.backgroundColor = UIColor.gray
        view1.addSubview(view4)
        
        view4.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(view2.snp.bottom).offset(20)
            make.left.height.equalTo(view2)
            make.width.equalTo(view2).multipliedBy(0.3)
        }
        
        let view5 = UIView()
        view5.backgroundColor = UIColor.gray
        view1.addSubview(view5)
        
        view5.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(view2.snp.bottom).inset(20)
            make.right.height.equalTo(view2)
            make.width.equalTo(view2).multipliedBy(0.3)
        }
    }
    
    //MARK: - 视图更新
    /**
     使用snp.updateConstraints更新约束
     
     我们还可以用snp.updateConstraints方法来代替snp.makeConstraints进行约束的更新，
     这个更新操作通常放在UIViewController的updateViewConstraints()方法中，
     或者UIView的updateConstraints()方法中执行，这样视图约束需要更新的时候会自动调用。
     */
    func snapUpdate()
    {
        box.backgroundColor = UIColor.orange
        
        self.view.addSubview(box)
        
        box.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.height.equalTo(150)
            make.centerX.equalTo(self.view)
        }
    }
    
    /**
     这个时候屏幕旋转之后也可以适配到屏幕高度
     */
    override func updateViewConstraints() {
        
//        self.box.snp.updateConstraints { (make) in
//            make.width.equalTo(self.view)
//        }
        
        self.box.snp.updateConstraints { (make) in
            make.width.height.equalTo(100 * self.scacle).priority(250)
        }
        
        super.updateViewConstraints()
    }
    
    //MARK: - 约束优先级
    /**
     （1）优先级设置
     
     通过priority()方法我们可以设置任意的优先级，接受的参数是0-1000的数字。比如：priority(600)。
     
     如果不设置的话，默认的优先级是1000。
     
     （2）使用优先级的样例
     
     下面我们在屏幕中央放置一个100*100的橙色方块，给其定义了长宽尺寸小于等于屏幕的大小的默认优先级约束。同时，每次点击屏幕的时候，会更新放大它的尺寸。但由于这个约束的优先级是低，所有方块顶到屏幕边缘后就会不再放大。
     */
    func snapPriority()
    {
        /**
         添加点击事件
         */
//        let tapSingle = UITapGestureRecognizer(target: self, action: #selector(tapSingleDid))
//        tapSingle.numberOfTapsRequired = 1
//        tapSingle.numberOfTouchesRequired = 1
//        
//        self.view.addGestureRecognizer(tapSingle)
        
        self.box.backgroundColor = UIColor.orange
        self.view.addSubview(self.box)
        
        self.box.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(100 * self.scacle).priority(250)
            
            /**
             限制最大尺寸不能超过屏幕
             */
            make.width.height.lessThanOrEqualTo(self.view.snp.width)
            make.width.height.lessThanOrEqualTo(self.view.snp.height)
        }
    }
    
//    func tapSingleDid()
//    {
//        self.scacle += 0.5
//        
//        self.view.setNeedsUpdateConstraints()
//        
//        UIView.animate(withDuration: 0.3) { 
//            self.view.layoutIfNeeded()
//        }
//    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.scacle += 0.2

        self.view.setNeedsUpdateConstraints()

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK: -
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

