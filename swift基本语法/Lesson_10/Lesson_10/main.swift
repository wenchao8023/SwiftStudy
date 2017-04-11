//
//  main.swift
//  Lesson_10
//
//  Created by 郭文超 on 16/8/12.
//  Copyright © 2016年 wc. All rights reserved.
//

/*------------------------------------------方法-----------------------------------------------*/

import Foundation

/**
 *（1）实例方法
 * (2)通过实例来调用的方法, 也就是一般意义的类对象
 */
print("**********************实例方法**************************")
class MyPoint {
    var _x: Double = 0.0
    var _y: Double = 0.0
    
//    func setP(x: Double, y: Double) {
//        _x = x
//        _y = y
//    }

    func setP(x: Double, y: Double) {
        self._x = x
        self._y = y
    }
    
    func description() {
        print("<#isa MyPoint, x = \(_x), y = \(_y)#>")
    }
}

var p0 = MyPoint()
var p1 = MyPoint()
p0.setP(10, y: 5)   //p0 = self
p1.setP(5, y: 10)   //p1 = self
p0.description()
p1.description()



/**
 *（2）方法的参数名称
 *      在参数列表中的，第一个参数默认为内部参数，第一个以后的参数即作为内部参数也作为外部参数
 *      如果不想后面的参数也作为外部参数，就在前面加一个 "_ "
 */
func setP(x: Double, _ y: Double) {
    print("x = \(x), y = \(y)")
}
setP(10, 10)

/**
 *（3）self解释
 *      self表示当前对象，和oc中的理解是一样的
 */
func setX(x x: Double, y: Double) {
    
}


/**
 *（4）mutating方法
 *      值类型（结构体或枚举）的默认方法是不可修改属性的，如果修改需要做特殊处理（在定义方法的func 前面加上mutating关键字）
 *      加了mutating关键字的方法除了可以修改属性，还可以修改self
 */
class MyPerson {
    var name: String = ""
    var age: Int = 0
    
    /*mutating*/ func set(name name: String, age: Int) {    //现在的版本可以不用mutating来修饰就可以直接修改变量属性了
        self.name = name
        self.age = age
    }
    
    func description() {
        print("name = \(name), age = \(age)")
    }
}
var m0 = MyPerson()
m0.set(name: "xiaoWu", age: 20)
m0.description()
let m1 = MyPerson()
m1.set(name: "daWu", age: 21)
m1.description()


enum LightSwich {
    case OFF, LOW, HIGH
    
    mutating func next() {
        switch self {
        case OFF:
            self = LOW
        case LOW:
            self = HIGH
        case .HIGH:
            self = OFF
        }
    }
}
var light = LightSwich.LOW
light.next()
print("light = \(light)")


/**
 *（5）类方法
 *      通过类名来调用的方法，和类型属性一样
 *      类方法对应的关键字是static（枚举和结构体）和class（类）
 *      类方法里面不存在self（在oc中如果类方法中出现self会造成循环引用）
 *      对于变量，这里可以直观的看到
 *          一般变量用self来访问，self都会省略不写；
 *          静态变量需要用类名（结构体名）来访问
 */
class TypeMethods {
    var p: Int = 0
    static var sp: Int = 0
    
    //一般方法
    func method() {
        print("p = \(p), sp = \(TypeMethods.sp/*访问静态变量*/)")
    }
    
    //类方法, 静态成员方法
    //  不能访问普通的成员变量, 只能访问静态static成员变量
    static func staticMethod() {
        print("sp = \(TypeMethods.sp)")
    }
}
var tm = TypeMethods()
tm.method()
//静态方法只能由类名（结构体名）来调用
TypeMethods.staticMethod()


let array = [1, 2, 3, 4, 5]
print(array[1])



































