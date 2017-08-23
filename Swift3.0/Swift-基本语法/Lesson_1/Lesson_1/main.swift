//
//  main.swift
//  Lesson_1
//
//  Created by 郭文超 on 16/8/4.
//  Copyright © 2016年 wenchao. All rights reserved.
//

//导入框架
import Foundation

/// 编码风格    句末最后加不加封号都可以，习惯还是加上


/**
 *  变量和常量
 */

//定义变量
var a = 10;
print("a = \(a)");
a = 9;
print("a = \(a)");

//定义常量, 不可以被修改
let b = 10;
print("b = \(b)");



/**
 *  类型标注
 *  格式  [var 变量名: 类型]
 */
var x: Int;
x = 10;
let y: Int = 10;    //常量必须在定义的时候赋值

/**
 *  名称不用再符合标识符的规范，甚至可以是中文名称
 *  不能以数字开头
 *  不能使用特殊符号
 */
let 常量 = 10;
print("常量 = ",常量);

/**
 *  基本数据类型：整数类型 和 小数类型
 */

/**
 *  整数类型，默认整形类型是Int
 *  Int8/16/32/64
 *  UInt8/16/32/64
 *  UInt8.max 或者是 UInt8(UINT8_MAX)可以获得这个类型的最大值
 *  UInt8.min 或者是 UInt8(UINT8_MIN)……………………………………最小值
 */
let Integer: Int = 10;
let unsignedInteger: UInt = 20;
//let overInteger: UInt8 = UInt8.max + 1;
let intM: Int8 = Int8.max;
let uIntM: UInt8 = UInt8.max;
let intMin: Int8 = Int8(INT8_MIN);
print(" Int8.max = \(intM)\n Uint8.max = \(uIntM)\n Int8.min = \(intMin)");



/**
 *  小数类型
 *  Double/Float
 */
let floatValue: Float = 3.4;

/**
 *  两种基本类型是否可以隐式转换
 */
var intVar: Int = 10;
//var doubleVar: Double = intVar;   //报错了，表示不允许




/**
 *  类型推断和类型安全
 */
let stringValue = "Hello"   //<=>let stringValue: String = "Hello"

//类型安全表现在只有相同的类型才可以做运算
var uint8Value: UInt8 = 9;
var uint16Value: UInt16 = 9;
//var uint32Value: UInt32 = uint8Value + uint16Value;   不允许
//var uint16Value2: UInt16 = uint8Value + uint16Value;  不允许
var uint32Value1: UInt32 = 9;
var uint32Value2: UInt32 = 10;
var uint32Value3: UInt32 = uint32Value1 + uint32Value2; //允许, 只有完全相同的类型才能做运算

/**
 *  类型转换:  类型(变量)
 */
print("************类型转换*******************************************************")

// float -> Int
print("floatValue 转换前 : \(floatValue)");
intVar = Int(floatValue);
print("floatValue 转换后 : \(floatValue) ->> \(intVar)");

// Int -> float
var FI: Float = 1.0
print("FI 转换前 : \(FI)")
FI = Float(intVar)
print("FI 转换后 : \(FI)")

/**
 *  BOOL 类型
 */
print("************BOOL类型*******************************************************")
let turnOffLight = true
if turnOffLight {   //if 后面只能放bool值, 不能再放整数了
    print("Turn Off")
}
else {
    print("Turn On")
}

var tureValue = 1;



/**
 *  元组    (30, "hello")
 *  将不同数据类型的数据组合在一起   直接使用，类似结构体但不需声明
 *  可以作为参数在函数中使用，可以携带多个值
 */
print("*************元组类型******************************************************")
let student = ("zhangSan", 23, 8.5) //<=>let student: (String, Int, Double) = ("zhangSan", 23, 8.5)

//获取元组对应下标的元素1
print("通过下标获取元素");
print(student.0)
print(student.1)
print(student.2)

//获取元组对应下标的元素2（提取元组）
print("提取元组");
let (name, age, score) = student
print(name)
print(age)
print(score)

let (name1, _, _) = student     //不需要后两个就用 _ 表示
print(name1)
//print(age)
//print(score)

/// 字典做元素
print("字典做元素");
let student1 = (xingMing:"zhangSan", nianLing:"23")
print(student1.xingMing)
print(student1.nianLing)

print(student)
print(student1)


var testStd: (String, Int) = ("chaoge", 23)
print("testStd is : \(testStd)")
testStd.0 = "婷宝宝"
print("testStd modify is : \(testStd)")


let arr = [1, 2, 3, 5, 6, 2, 3]
//print("返回的元组是 : \(self.functoin4(arr))")




func functoin1() -> Void {
    print("无参数无返回类型")
}

func fucntion2() -> String {
    let name : String = "无参数有返回值"
    return name
}

func function3(name : String) -> Void {
    print("有参数无返回值, 参数是 : \(name)")
}
// 有参数有返回值
func functoin4(name : String) -> String {
    let result = "Hello, " + name
    return result
}
// 使用元组返回多个值 -- 在后面的函数章节测试
func maxminScores(scores:[Int]) -> (maxscore: Int, maxminScore: Int) {
    var curmax = scores[0], curmin = scores[0]
    for score in scores[1..<scores.count] {
        curmax = max(curmax, score)
        curmin = min(curmin, score)
    }
    
    return (curmax, curmin)
}




/**
 *  可选类型   optionals 两种状态： 有值 没值(nil)
 */
print("*************可选类型******************************************")
var optValue: Int? = 8
if (optValue != nil) {
    print(optValue!)
}

//！表示对可选值的强制解析，解包
//因为是强制解包，也就是说不管这里面有没有值都会进行解包，如果没有值的时候回造成运行时错误
//var sValue: Int = optValue!
//print(sValue)

//可选值绑定，一种固定写法
if var sValue = optValue {
    print("sValue =", sValue)
}



//也等价于下面的写法
if (optValue != nil) {
    var sValue1 = optValue!
    print("sValue1 =", sValue1)
}

/**
 *  隐式解析可选类型   两种状态： 有值 没值(nil)
 */
print("*************隐式解析可选类型****************************************************")
var impOptValue: Int! = 9
if impOptValue != nil {
    print(impOptValue)
}

if let iValue = impOptValue {
    print(iValue)
}

if impOptValue != nil {
    let iValue1 = impOptValue!
    print(iValue1)
}

//隐式可选类型 和可选类型的区别

//如果定义的是隐式可选类型的话，就不需要手动进行解包，如果可选值是nil，那么还是会导致运行时错误
var iValue2: Int = impOptValue      //可以直接赋值，不需要加！




