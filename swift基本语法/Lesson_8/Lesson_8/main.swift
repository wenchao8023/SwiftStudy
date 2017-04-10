//
//  main.swift
//  Lesson_8
//
//  Created by 郭文超 on 16/8/11.
//  Copyright © 2016年 wc. All rights reserved.
//

import Foundation

/** 
 *(1)结构体定义
 */
struct Rect {
    var width: Double
    var height: Double
}


/**
 *(2)结构体的实例和属性访问
 */
struct Rect1 {
    var width: Double = 0.0
    var height: Double = 0.0
}
//定义一个结构体变量
var rect: Rect1 = Rect1()
//点语法可以访问成员变量
rect.height = 10
print(rect)
var rect1: Rect1 = Rect1()
rect1.width = 100
print(rect1)


/**
 *(3)结构体的构造器(构造函数)
 *  构造函数有两种 不带参数的Rect1()   带参数的(逐一成员构造函数)Rect1(width: 9, height: 9)
 */
//结构体逐一成员构造函数
//  1.必须是按照结构体成员的顺序
//  2.必须包含结构体的所有成员
//  3.如果要使用不带参数的构造函数, 那么需要保证所有成员都有默认值, 否则必须用逐一成员构造方法来给所有成员初始胡
var rect2: Rect1 = Rect1(width: 9, height: 9)


/**
 *(4)结构体的添加方法
 *  方法一定要在结构体内部定义
 *  可以和相比于类来理解, 分别是类的属性和方法
 */

struct Rect3 {
    var width: Double
    var height: Double
    func getWidth() ->Double {
        return width
    }
    func getArea() ->Double {
        return width * height
    }
    func getCircumference() ->Double {
        return 2 * (width + height)
    }
    func testParameter(a: Double, b: Double) ->Double {
        return a + b
    }
}

var rect3: Rect3 = Rect3(width: 9, height: 9)
rect3.width = 11
//成员方法的调用语法: 对象.func()
print(rect3.getWidth())
print(rect3.getArea())
print(rect3.getCircumference())
print(rect3.testParameter(234, b: 23))


/**
*(5)结构体的值类型
*/

//结构体的整体赋值
var rect3_1 = rect3     //<=>var rect3_1: Rect3 = rect3
/*假设:
    (1)rect3_1 和rect3指向同一块内存                  ---- 浅拷贝
    (2)rect3_1 和rect3是两个不同的实例, 但是内容的值一样 ---- 深拷贝
*/
//验证
rect3.width = 15
print(rect3.getWidth())     // ==== 15.0
print(rect3_1.getWidth())   // ==== 11.0
//显然不是指向同一块内存, 说明结构体是值类型, 拷贝过来的仅仅是内容



