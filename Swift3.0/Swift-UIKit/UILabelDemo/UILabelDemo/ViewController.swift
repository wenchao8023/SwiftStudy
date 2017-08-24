//
//  ViewController.swift
//  UILabelDemo
//
//  Created by chao on 2017/3/31.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit


struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

/**
 *  自定义一个 rect，实现 center 的 setter 和 getter 方法
 */
struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

/**
 *  上个 rect 中 setter 方法的简写
 *  如果有实现 setter 方法，则会默认用 newValue 来代替新的值，所以 setter 方法也不需要携带参数了
 */
struct simpleSetterInRect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        /**
         *  只要改变了 origin 的位置，那么就 center 的位置就会相应的发生改变，所以这里的 set 方法是对 origin 来进行操作
         */
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}



struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}





/// 属性观察者

class StepCounter: NSObject {
    var totalSteps: Int = 0{
        willSet(newTotalSteps){
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

/// 类型属性
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int
    {
        return 666
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int
    {
        return 555
    }
}

class SomeClass
{
    class var computedTypeProperty:Int
    {
        return 333
    }
}


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0
    {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createLabel()
        
        //根据文字设置Label的大小
        self.labelSizeOfText()
        
        let FFT = Cuboid(width: 4, height: 5, depth: 2)
        print("the volume of FFT is \(FFT.volume)")
        
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        
        stepCounter.totalSteps = 360
        
        stepCounter.totalSteps = 998
        
        
        print(SomeClass.computedTypeProperty)
        
        print(SomeStructure.storedTypeProperty)
        
        SomeStructure.storedTypeProperty = "Another value."
        
        print(SomeStructure.storedTypeProperty)
        
        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        
        leftChannel.currentLevel = 7
        print(leftChannel.currentLevel)
        
        print(AudioChannel.maxInputLevelForAllChannels)
        
        rightChannel.currentLevel = 11
        print(rightChannel.currentLevel)
        print(AudioChannel.maxInputLevelForAllChannels)
    }
    
    func labelSizeOfText() -> Void {
        
        //需要显示在label上的文字
        let str = "收到回复asdfsajfdkl刷卡费；爱打架发；欧弟就发了算法减肥；阿里的就发；埃里克森方法阿发；发；浪费纪检委上"
        
        //计算显示指定文字所需要的最小空间
        //1.将swift的字符串转换成OC的字符串
        let ocStr = str as NSString
        
        //2.计算字符串的大小
        //参数1:限制显示当前字符串的最大宽度和最大高度
        //参数2:设置渲染方式(UsesLineFragmentOrigin)
        //参数3:确定文字的字体(大小)
        //NSFontAttributeName ->字体对应的key值
        //NSForegroundColorAttributeName -> 文字颜色对应的key值
        let strSize = ocStr.boundingRect(with: CGSize.init(width: 200, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 17)], context: nil).size
        
        print("strSize is : " + NSStringFromCGSize(strSize))
        
        //3.创建label显示文字
        let label = UILabel.init(frame: CGRect.init(origin: CGPoint.init(x: 20, y: 20), size: strSize))
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.red
        self.view.addSubview(label)
        label.text = str
        //自动换行
        label.numberOfLines = 0
    }
    
    func createLabel() -> Void {
        
        //UILabel:UIView -> UIView的属性和方法，UILabel都拥有
        //=======从UIView继承下来的属性=======
        //1.创建UILabel对象
        let label = UILabel.init(frame: CGRect.init(x: 100, y: 300, width: 200, height: 300))
        //2.添加到界面上
        self.view.addSubview(label)
        //3.设置背景颜色
        label.backgroundColor = UIColor.black
        
        //========UILabel的专有属性=========
        //1.text属性
        //设置label上显示的文字
        label.text = "hello world"
        //拿到Label上当前显示的文字
        print(label.text!)
        
        //2.设置字体（字体大小默认是:17）
        //使用系统字体，设置字体大小
        label.font = UIFont.systemFont(ofSize: 17)
        
        //使用系统字体，设置字体大小和粗细
        //参数1:字体大小
        //参数2:字体粗细(小于1)
        label.font = UIFont.systemFont(ofSize: 17, weight: 0.2)
        
        //使用系统黑体，设置字体大小
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        //使用系统斜体，设置字体大小
        label.font = UIFont.italicSystemFont(ofSize: 20)
        
        //获取系统所有字体的字体名
        //75
//        print(UIFont.familyNames,UIFont.familyNames.count)
        //参数1:字体名
        //参数2:字体大小
        label.font = UIFont.init(name: "FZJKai-Z03S", size: 17)
        //总结使用自己的字体的步骤：
        //1.将ttf文件拖到工程中
        //2.在info.plist文件中添加键值对"Fonts provided by application",将字体添加到系统字体库中
        //3.通过提供字体名的构造方法去创建字体（先要找到自己添加的字体的字体名）
        
        //3.设置文字颜色
        label.textColor = UIColor.red
        
        //4.设置阴影颜色
        label.shadowColor = UIColor.yellow
        //5.设置阴影的偏移效果
        label.shadowOffset = CGSize.init(width: 0, height: 0.5)
        
        //6.设置文字的对齐模式(默认是左对齐)
        //Center -> 居中
        //Right -> 右对齐
        //Left -> 左对齐
        label.textAlignment = .center
        
        label.text = "default is NSLineBreakBy TruncatingTail used for single and multiple lines of text 这样就用代码实现了label的创建，其中initWithFrame设置了label的位置还有大小，奥斯卡的积分换空间和"
        
        //7.设置行数
        label.numberOfLines = 5
        //自动换行
        label.numberOfLines = 0
        
        //8.设置换行模式
        //byWordWrapping -> 以单词为单位换行
        //byCharWrapping -> 以字符为单位换行
        //byClipping
        //byTruncatingHead
        //byTruncatingTail
        //byTruncatingMiddle
        label.lineBreakMode = .byCharWrapping
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

