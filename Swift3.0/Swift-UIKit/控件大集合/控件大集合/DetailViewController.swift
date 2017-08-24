//
//  DetailViewController.swift
//  控件大集合
//
//  Created by chao on 2017/4/1.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit




class DetailViewController: UIViewController {

    public var indexPath: NSIndexPath? = nil
    
    public var myTille: String? = nil;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.cyan
        
        self.navigationItem.title = self.myTille
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(indexPath!.row)
        
        let selectorStr: String = String("function" + String((indexPath!.row)))
        
        self.perform(NSSelectorFromString(selectorStr))
    }
    
    //MARK: - 创建控件
    
    //MARK: -- 创建开关
    func function0() -> Void {
        //1.创建开关对象
        //UISwitch:UIControl:UIView
        let sw = UISwitch.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 50))
        //2.添加到界面上
        self.view.addSubview(sw)
        
        //3.核心属性:开关状态(默认是：关)
        //设置开关的状态
        sw.isOn = true  //false -> 关
//        sw.setOn(false, animated: true)
        //拿到当前的状态
        print(sw.isOn)
        
        //4.核心方法:
        //参数1:调用方法的对象
        //参数2:指定的事件发生后参数1要去调用的方法对应的selector
        //参数3:事件
        //功能:当开关的值(开关的状态)发生改变的时候，self会去调用switchAction方法
        sw.addTarget(self, action: #selector(switchAction(sw:)), for: .valueChanged)
        
        //5.设置开关开的状态的颜色(默认是绿色)
        sw.onTintColor = UIColor.red
        //6.开关关闭的时候的边框颜色
        sw.tintColor = UIColor.purple
        //7.设置开关上的滑块的颜色
        sw.thumbTintColor = UIColor.black
        
        sw.backgroundColor = UIColor.darkGray
    }
    
    func switchAction(sw: UISwitch) -> Void {
        print(sw.isOn)
    }
    
    
    //MARK: --滑动条
    func function1() -> Void {
        
        let lab: UILabel = UILabel.init(frame: CGRect.init(x: 100, y: 40, width: 180, height: 40))
        lab.text = "值 -> 连续改变"
        self.view.addSubview(lab)
        
        //1.创建滑条对象
        //UISlider:UIControl:UIView
        let slider = UISlider.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 20))
        //2.添加到界面上
        self.view.addSubview(slider)
        
        //3.核心属性:值
        //value:滑块的位置对应的值（默认是0~1）
        slider.value = 0.5
        //最小值和最大值
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        //4.核心方法
        slider.addTarget(self, action: #selector(sliderAction(slider:)), for: .valueChanged)
        
        //7.是否连续改变
        slider.isContinuous = true
        
        //5.和颜色相关的属性
        
        //6.和图片相关的属性
        
        
        let lab2: UILabel = UILabel.init(frame: CGRect.init(x: 100, y: 140, width: 180, height: 40))
        lab2.text = "值 -> 不连续改变"
        self.view.addSubview(lab2)
        
        //1.创建滑条对象
        //UISlider:UIControl:UIView
        let slider2 = UISlider.init(frame: CGRect.init(x: 100, y: 200, width: 200, height: 20))
        //2.添加到界面上
        self.view.addSubview(slider2)
        
        //3.核心属性:值
        //value:滑块的位置对应的值（默认是0~1）
        slider2.value = 0.5
        //最小值和最大值
        slider2.minimumValue = 0
        slider2.maximumValue = 100
        
        //4.核心方法
        slider2.addTarget(self, action: #selector(sliderAction(slider:)), for: .valueChanged)
        
        //7.是否连续改变
        slider2.isContinuous = false
        
        //5.和颜色相关的属性
        
        //6.和图片相关的属性
        

        let valueLabel = UILabel.init(frame: CGRect.init(x: 100, y: 300, width: 100, height: 40))
        valueLabel.tag = 110
        self.view.addSubview(valueLabel)
    }
    
    func sliderAction(slider: UISlider) -> Void {
        print(slider.value)
        
        let lab = self.view.viewWithTag(110) as! UILabel
        lab.text = String(slider.value)
        
    }
    
    //MARK: --进度条
    func function2() -> Void {
        
        //1.创建进度条对象
        //UIProgressView : UIView
        let progress = UIProgressView.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 20))
        progress.tag = 100
        //2.添加到界面上
        self.view.addSubview(progress)
        
        //3.核心属性
        //进度:0~1
        //设置当前进度
        progress.progress = 0.2

        sleep(1)
        
        progress.setProgress(0.8, animated: true)
        
        
        //4.颜色相关
        //5.图片相关
    }

    
    //MARK: --步进器
    func function3() -> Void {
        
        //1.创建步进器对象
        let stepper = UIStepper.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 50))
        //2.添加到界面上
        self.view.addSubview(stepper)
        
        //3.核心属性:值
        //当前值
        stepper.value = 1
        print(stepper.value)
        //最小值和最大值
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        //步进(每按一下加或者减，增加/减少的值)
        stepper.stepValue = 1  //步进值必须大于0
        
        stepper.addTarget(self, action: #selector(stepperAction(stepper:)), for: .valueChanged)
        
        //5.设置值是否连续改变(按住不放的时候)
        stepper.isContinuous = false
        
        //6.设置是否重复 false->按住不放的时候不计数；true->按住不放的时候计数(默认)
        stepper.autorepeat = false
        
        
        //7.设置填充颜色
        stepper.tintColor = UIColor.red
    }
    
    func stepperAction(stepper: UIStepper) -> Void {
        print(stepper.value)
    }
    
    //MARK: --多段选择器
    func function4() -> Void {
        //1.创建多段选择器对象
        //UISegmentedControl : UIControl
        //参数1:分段选择器上的内容对应的数组
        let seg = UISegmentedControl.init(items: ["海贼王", "火影忍者", "死神"])
        seg.frame = CGRect.init(x: 20, y: 100, width: 300, height: 50)
        seg.backgroundColor = UIColor.black
        self.view.addSubview(seg)
        
        //3.核心属性
        //a.每个分段上的内容 ->通过创建分段选择器的时候去设置
        //b.当前选中的分段的下标(从0开始)
        seg.selectedSegmentIndex = 0
        
        //4.核心方法
        seg.addTarget(self, action: #selector(segClick(seg:)), for: .valueChanged)
        
        //5.拿到分段选择的分段数
        print(seg.numberOfSegments)
        
        //6.设置填充颜色
        seg.tintColor = UIColor.lightGray
    }
    
    func segClick(seg:UISegmentedControl) -> Void {
        print(seg.selectedSegmentIndex)
        //5.拿到分段选择的分段数
        print(seg.numberOfSegments)
        
        if seg.selectedSegmentIndex + 1 == seg.numberOfSegments {
            seg.insertSegment(withTitle: String(seg.numberOfSegments), at: seg.numberOfSegments, animated: true)
        }
        
        if (seg.numberOfSegments > 2 && seg.selectedSegmentIndex == 0) {
            seg.removeSegment(at: 0, animated: true)
        }
    }
    //MARK: --菊花
    func function5() -> Void {
        
        let button = UIButton.init(frame: CGRect.init(x: 100, y: 300, width: 100, height: 40))
        button.setTitle("菊花", for: .normal)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
        
        //1.创建活动指示器对象
        //UIActivityIndicatorView : UIView
        let activity = UIActivityIndicatorView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        //2.添加到界面上
        self.view.addSubview(activity)
        activity.backgroundColor = UIColor.lightGray
        activity.alpha = 0.8
        activity.layer.cornerRadius = 10
        activity.tag = 140
        
        //3.想要让活动指示器显示，必须让它开始动画
        activity.startAnimating()
        //4.停止动画->活动指示器就会消失
        //activity.stopAnimating()
        
        //5.设置活动指示器的样式
        activity.activityIndicatorViewStyle = .whiteLarge
    }
    
    func buttonClick() -> Void {
        let activity = self.view.viewWithTag(140) as! UIActivityIndicatorView
        
        if activity.isAnimating {
            activity.stopAnimating()
        } else {
            activity.startAnimating()
        }
    }
    
    func function6() -> Void {
        
        let alertControl = UIAlertController.init(title: "表单视图", message: "提示信息", preferredStyle: .actionSheet)
        
        
        let alertAction1 = UIAlertAction.init(title: "确定", style: .default) { (_) in
            print("确定")
        }
        
        let alertAction2 = UIAlertAction.init(title: "取消", style: .cancel) { (_) in
            print("取消")
        }
        
        alertControl.addAction(alertAction1)
        
        alertControl.addAction(alertAction2)
        
        self.present(alertControl, animated: true) { 
            print("结束了")
        }

    }
    func function7() -> Void {
        
    }
    func function8() -> Void {
        
        let textView = UITextView.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 400))
        
        textView.backgroundColor = UIColor.green
        
        textView.text = ";akfjalijfaoigjjkalfja;lifj;weqeqerqreqer;iojq;erj;lkjrrlwqejrodwersad13dadf;alijf;ajroqijads;flaisfdj;"
        self.view.addSubview(textView)
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
