//
//  ViewController.swift
//  UITextFeildDemo
//
//  Created by chao on 2017/4/1.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UITextField:UIControl:UIView
        //===========UIView的属性和方法=======
        //1.创建UITextField对象
        let textField = UITextField.init(frame: CGRect.init(x: 20, y: 100, width: 200, height: 60))
        //2.添加到界面上
        self.view.addSubview(textField)
        //3.设置背景颜色
        textField.backgroundColor = UIColor.lightGray
        textField.layer.cornerRadius = 8
        
        //1.创建UITextField对象
        let textField2 = UITextField.init(frame: CGRect.init(x: 20, y: 180, width: 200, height: 60))
        //2.添加到界面上
        self.view.addSubview(textField2)
        //3.设置背景颜色
        textField2.backgroundColor = UIColor.lightGray
        textField2.layer.cornerRadius = 8
        
        
        //=====textField的专有属性和方法====
        //(1)文字相关
        //1.text属性
        //设置文本输入框的内容
        textField.text = "啊哈哈哈"
        //拿到文本输入框的内容
        print(textField.text!)
        
        //2.文字颜色
        textField.textColor = UIColor.brown
        
        //3.设置文字字体
        textField.font = UIFont.systemFont(ofSize: 14)
        
        //4.设置占位文字(在输入框的内容为空的时候就会显示出来)
        textField.placeholder = "请输入账号"
        
        //5.设置文本的对齐方式(默认是:左对齐)
        textField.textAlignment = .left
        
        //6.密文显示(默认是false)
        textField.isSecureTextEntry = true
        
        
        //(2)显示相关
        //1.设置文本框的样式
        textField.borderStyle = .roundedRect
        
        //2.设置清除按钮模式(清除按钮实质是rightView)
        //(前提是输入框中有文字)
        //Always -> 一直显示
        //Never -> 从不显示(默认)
        //WhileEditing -> 当文本输入框处于编辑状态的时候才显示
        //UnlessEditing ->当文本输入框处于非编辑状态的时候才显示
        //注:当文本输入框中有光标的时候就是处于编辑状态
        textField.clearButtonMode = .always
        
        
        //3.左视图
        let leftImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        leftImageView.image = UIImage.init(named: "AppIcon")
        //设置左视图
        textField.leftView = leftImageView
        //设置左视图的显示模式(确定什么时候显示，默认是从不显示)
        textField.leftViewMode = .always
        
        //4.右视图
        //当右视图显示的时候，清除按钮不能显示
        let rightLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        rightLabel.text = "你好"
        textField.rightView = rightLabel
        textField.rightViewMode = .always
 
        
        //(3)键盘相关
        //1.设置键盘上返回按钮的样式
        textField.returnKeyType = .search
        
        //2.键盘样式
        textField.keyboardType = .default
        
        //3.设置自定义的键盘
        //自定义的键盘，只有高度有效。宽度是屏幕的宽度
        let myInputView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 256))
        
        myInputView.backgroundColor = UIColor.red
        //textField.inputView = myInputView
        
        //4.设置子键盘
        let accessoryView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 50))
        accessoryView.backgroundColor = UIColor.green
        textField.inputAccessoryView = accessoryView
        
        //(4)设置代理
        //textField ->委托
        //self -> 代理
        textField.delegate = self
    }
    
    
    //MARK: - UITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print("返回按钮被点击")
        
        //收起键盘(结束编辑)
        //1.放弃第一响应者
        textField.resignFirstResponder()
        //2.直接让指定的textField结束编辑
        textField.endEditing(true)
        //3.让self.view上的所有的子视图都结束编辑
        self.view.endEditing(true)
        return true
    }
    
    //5.当点击textField弹出来的键盘上的按键的时候会自动调用这个方法
    //参数1:委托
    //参数2:当前输入的字符所在的位置
    //参数3:当前输入的字符串(在键盘上按的键的值)
    //返回值:是否可改变textField的text属性();false -> 按键盘上的按键无效
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(range)
        print(string)
        if string == "0" {
            
            print("进入秘密页")
        }
        
        return true
    }
    
    //4.当文本输入框已经结束编辑的时候会自动调用这个方法
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        print("已经结束编辑")
    }

    //2.当文本输入框已经开始编辑的时候会自动调用这个方法
    func textFieldDidBeginEditing(_ textField: UITextField){
        
        print(textField.text!)
        print("已经开始编辑")
    }
    
    //3.当文本输入框将要结束编辑的时候会自动调用这个方法
    //返回:设置当前的textField是否可以结束编辑(默认是true)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("将要结束编辑")
        
        //要求文本输入框中的文字长度要大于等于8的时候才能结束编辑
        if (textField.text?.characters.count)! >= 8 {
            
            return true
        }
        
        return false
    }
    
    //1.在textField将要开始编辑的时候会自动调用
    //参数:当前这个协议对应的委托
    //返回值:设置当前的textField是否可以进行编辑(默认是true)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
        print("将要开始编辑")
        
        return true  //false ->让textField不能进行编辑
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

