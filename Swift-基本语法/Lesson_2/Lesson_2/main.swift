//
//  main.swift
//  Lesson_2
//
//  Created by 郭文超 on 16/8/5.
//  Copyright © 2016年 wenchao. All rights reserved.
//

import Foundation

/**
 *字符和字符串
 *计算机本质（编程核心）是： 数据 + 数据处理
 *本章： 字符信息 + 字符信息处理
 */

print("********字符*******************************")
/**
 *定义单个字符的时候用的是""，不是''
 *swift语言是兼容unit标准的，所以字符可以直接是汉字
 */
let a: Character = "a"
var b: Character
b = "b"
b = "必"

print("********字符串*******************************")
/**
 *字符串本身也是一个结构体
 *字符串里面遵循的规则不再仅仅是ASCLL标准了，而是遵循unit标准
 */
var c: String
c = "qw\ne\0r0/郭文超\tU0001f496"
print(c)

var d = "123郭"
print("\(d) 的长度是: \(d.characters.count)")
//countElements(d)可以计算d中的元素个数，不是长度，是计算个数，该方法在10.10.3中被废除
//在这里获取字符串长度的方法可以是 str.characters.count 后面可能会接触其他方法

print("********字符串的构造*******************************")

//字符串的拼接
let str1 = "hello"
let str2 = "world"
let str = str1 + str2   //这种规则和Java中是一样的，+ 表示拼接两个字符串
print(str)

//格式化字符串    \(变量)
var index = 9
var urlHead = "http://www.mobiletrain.org/pic"
let message = "\(urlHead)/\(index).png"
print(message + " hah")

//字符串的比较
//  是逐个按照字母一个个来进行比较大小（阿斯卡吗值大小比较）
let strC = "hello"
if strC == "hello" {
    print(strC)
}
//字符串前缀
if strC.hasPrefix("he") {
    print(strC)
}
//字符串后缀
if strC.hasSuffix("lo") {
    print(strC)
}

var strC1 = "Apple"
//字符转大写
print(strC1.uppercased());
//字符转小写
print(strC1.lowercased())

//字符串转整型    返回结果是一个可选类型(也可以是隐式可选)
//不要直接转隐式的可选类型，如果不是数字的时候就会导致可选值为nil，强转的话会报错的
var str3 = "255d"
let rec: Int? = Int(str3)
if let rrr = rec {
    print("字符串转整型 is \(rrr)")
} else {
    print("字符串转整型 failure")
}



print("********运算符*******************************")
/**
 *数学运算 + - * / % ++ --
 *逻辑运算
 *注意溢出问题（特别是隐式溢出，也就是变量做运算的时候）
 */
let v = 3 + 5
let r = v * 3
print("v = \(v), r = \(r)")

//求余运算  可以对浮点数求余
print(5.truncatingRemainder(dividingBy: 1.5))
print(5.truncatingRemainder(dividingBy: 3))


/**
*赋值运算符 = += -= *= /= %=
*/
var aa = 8
var bb = 9
var cc: Int = 10
var dd: Int
//dd = cc = 10      不允许连 = ,  cc = 10这个表达式的值为空

/**
 *关系运算符 > < >= <= == != ?:
 */
let rec1: Bool = 3 == 5 + 3
let min = 3 > 2 ? 2 : 3
print("rec1 = \(rec1), min = \(min)")

/**
 *逻辑运算符 && || ！
 *逻辑运算符的对象也要求是Bool类型的，整数类型的都不行
 */
var allowLeave = true
if !allowLeave {
    print("fei")
}
let t = true
let f = false
if t && f {
    print("yu")
}
if t || f {
    print("huo")
}
/**
 *区间运算符
 *闭区间运算符: (a...b) 表示 包括a 和b 及中间的所有数 1...3 表示 1, 2, 3
 *半闭区间运算符: (a..<b) 表示 包括a 及中间的所有数 1..< 3 表示 1, 2    取数组里面的值
 */
for _ in 1...5 {
    print("for _ in")
}
for i in 1...5 {
    print(i)
}

for _ in 1..<5 {
    print("半闭区间")
}
for i in 1..<5 {
    print("半闭区间\(i)")
}

let numArr = [1, 2, 3, 5, 2, 2, 3, 4, 5, 2, 1]
var sum: Int = 0
var lastSum: Int = 0
for i in 0..<numArr.count { // i 表示下标
    if i >= 1 {
        lastSum += numArr[i - 1]
    }
    sum = lastSum + numArr[i]
    print("\(lastSum) + \(numArr[i]) = \(sum)")
}


// 字符串截取
let str10 = "www.missajj.com"
// 转成 NSString 调用 NSSting 的字符串截取方法
var subStr = (str10 as NSString).substring(to: 4)
subStr = (str10 as NSString).substring(from: 5)
subStr = (str10 as NSString).substring(with: NSRange.init(location: 2, length: 4))


let str11: NSString = "我可以使用NS中的类型"
print(str11.substring(with: NSRange.init(location: 5, length:6)))







