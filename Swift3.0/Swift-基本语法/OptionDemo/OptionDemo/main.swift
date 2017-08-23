//
//  main.swift
//  OptionDemo
//
//  Created by chao on 2017/4/11.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import Foundation

print("Hello, World!")

/**
 *可选类型   optionals 两种状态： 有值 没值(nil)
 */
print("*************可选类型******************************************")
var optValue: Int? = 8
if optValue != nil {
    print(optValue!)
}

//！表示对可选值的强制解析，解包
//因为是强制解包，也就是说不管这里面有没有值都会进行解包，如果没有值的时候回造成运行时错误
//var sValue: Int = optValue!
//print(sValue)

//可选值绑定，一种固定写法
if var sValue = optValue {
    print("sValue = \(sValue)")
}

//也等价于下面的写法
if (optValue != nil) {
    var sValue1 = optValue!
    print("sValue1 =", sValue1)
}

/**
 *隐式解析可选类型   两种状态： 有值 没值(nil)
 */
print("*************隐式解析可选类型****************************************************")
var impOptValue: Int! = 9
if impOptValue != nil {
    print("impOptValue is \(impOptValue)")
}

if let iValue = impOptValue {
    print("iValue is \(iValue)")
    print("impOptValue is \(impOptValue)")
}

if impOptValue != nil {
    let iValue1 = impOptValue!
    print("iValue1 is \(iValue1)")
    print("impOptValue is \(impOptValue)")
}

//隐式可选类型 和可选类型的区别

//如果定义的是隐式可选类型的话，就不需要手动进行解包，如果可选值是nil，那么还是会导致运行时错误
var iValue2: Int = impOptValue      //可以直接赋值，不需要加！
print("iValue2 is \(iValue2)")





print("***************Optional Type总览*****************")

/**
 1. 什么是optional? Swift中声明的一个变量时, 默认情况下它是non-optional的, 即必须赋予这个变量一个非空的值. 如
    果给non-optional类型的变量赋值nil, 编译器就会报错。
 */
var string1: String = "This is string1" // OK
//string1 = nil  // Nil cannot be assigned to type 'String'
//- Swift中, 当声明一个类的属性时, 属性默认也是non-optional的
//swift
class MyClass {
    var name: String = "Lv"
    var age : String = ""
//    var age: String  // Class 'MyClass' has no initializers
}
//oc
//NSString *string1 = @"This is string1";
//string1 = nil;
//class MyClass {
//    NSString *name = @"Lv"
//    NSString *age;
//}

func findStockCode(company: String) -> String? {
    if company == "Apple" {
        return "APPL"
    } else if company == "Google" {
        return "GOOG"
    }
    
    return nil  //到这里返回的就是 没值的可选类型 也就是 nil
}

var stockCode: String? = findStockCode(company: "Facebook")
//let text = "Stock Code - "
//let message = text + stockCode!
//let message = text + stockCode // compile-time error
//print("message is \(message)")

if var faceCode = stockCode {
    print("faceCode is \(faceCode)")
} else {
    print("faceCode is nil")
}

var appCode: String? = findStockCode(company: "Apple")
if var message = appCode  {
    print("appCode is \(message)")
} else {
    print("appCode is nil")
}


print("***************可选链式调用(Optional Chaining)*****************")

class Stock {
    var code: String?
    var price: Double?
}

func findStockCode2(company: String) -> Stock? {
    if company == "Apple" {
        let appl: Stock = Stock()
        appl.code = "APPL"
        appl.price = 90.32
        return appl
    } else if company == "Google" {
        let goog: Stock = Stock()
        goog.code = "GOOG"
        goog.price = 556.36
        return goog
    }
    
    return nil
}

if let stock = findStockCode2(company: "Apple") { //返回值是 Stock? -- 可选值绑定(解包)一次
    if let sharePrice = stock.price {   //stock 中的 price？ -- 可选值绑定(解包)两次
        let totalCost = sharePrice * 100
        print("Apple 100股股票的价格为 : \(totalCost)")
    }
}

// 简写
if let sharePrice = findStockCode2(company: "Google")?.price {
    let totalCost = sharePrice * 100
    print("Google 100股股票的价格为 : \(totalCost)")
}







