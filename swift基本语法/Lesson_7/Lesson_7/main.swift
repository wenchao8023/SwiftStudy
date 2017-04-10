//
//  main.swift
//  Lesson_7
//
//  Created by 郭文超 on 16/8/11.
//  Copyright © 2016年 wc. All rights reserved.
//

import Foundation

/**
 *swift枚举
 *(1)枚举的基本语法
 *  class one
 */
enum OperationMethod {
    case Add    //case 后面跟的枚举变量的首字母大写
    case Sub
    case Mul
    case Div
}
/*<=>
    enum OperationMethod {
        case Add, Sub, Mul, Div
    }
*/
//定义一个枚举变量 m0, 赋值的时候 .枚举值
var m0: OperationMethod = .Add  //<=>var m0 = OperationMethod.Add
var m1 = OperationMethod.Sub


/**
 *(2)枚举和switch的结合使用
 */
//四个case里面返回的和下面注释的四个方法一样的，分别是用函数嵌套、闭包、闭包简写、闭包最简写
func chooseMethod(op: OperationMethod) ->(Double, Double) ->Double {
    switch op {
    case .Add:
        func add(a: Double, b: Double) ->Double {
            return a + b
        }
        return add
    case .Sub:
        return {(a: Double, b: Double) ->Double in return a - b}
    case .Mul:
        return {return $0 * $1}
    case .Div:
        return {$0 / $1}
    }
}
//func add(a: Double, b: Double) -> Double {
//    return a + b
//}
//func sub(a: Double, b: Double) -> Double {
//    return a - b
//}
//func mul(a: Double, b: Double) -> Double {
//    return a * b
//}
//func div(a: Double, b: Double) -> Double {
//    return a / b
//}

//方法调用
//方法签名: chooseMethod(op:OperationMethod) ->(Double, Double)  ->Double
let value = chooseMethod(.Div)  //返回的是一个函数或闭包
print(value)
let value1 = chooseMethod(.Div)(30, 5)  //返回的是一个值
print(value1)


/**
 *(3)枚举的原始值
 *枚举OperationMethou 中的值就是那几个单词，没有任何值，第一个也不是从0开始的
 *在定义枚举的时候给了具体的类型，就会给枚举值赋上具体的值
 */

//给了枚举值具体的类型Int，所以就有第一个枚举值的原始值是从0开始
//还可以是Double, String等类型, 比oc中的强大
enum OperationMethod1: Int {
    case Add, Sub = 3, Mul = 9, Div
}
//调用枚举值的原始值的OperationMethod1.Mul.rawValue
print("OperationMethod1 = \n Add = \(OperationMethod1.Add.rawValue),\n Sub = \(OperationMethod1.Sub.rawValue),\n Mul = \(OperationMethod1.Mul.rawValue),\n Div = \(OperationMethod1.Div.rawValue)")

enum OperationMethod2: String {
    case Add = "add", Sub = "sub", Mul = "mul", Div = "div"
}
print("OperationMethod2 = \n Add = \(OperationMethod2.Add.rawValue),\n Sub = \(OperationMethod2.Sub.rawValue),\n Mul = \(OperationMethod2.Mul.rawValue),\n Div = \(OperationMethod2.Div.rawValue)")

//通过原始值来获取枚举值, 返回的是可选类型, 所以在需要使用枚举值的时候需要解包
let op = OperationMethod2(rawValue: "add")
print("OperationMethod2(rawValue: \"add\") = \n\t\(OperationMethod2(rawValue: "add"))\n")

func chooseMethodRaw(rawOp: String) ->(Double, Double) ->Double {
    if let op = OperationMethod2(rawValue: rawOp)
    {
        switch op {
        case .Add:
            return {$0 + $1}
        case .Sub:
            return {$0 - $1}
        case .Mul:
            return {$0 * $1}
        case .Div:
            return {$0 / $1}
        }
    }
    else {
        return {$0 + $1}
    }
}
let rawOp = chooseMethodRaw("add")(4, 2)
print("chooseMethodRaw(\"add\")(4, 2) = \n\t\(chooseMethodRaw("add")(4, 2))")




//枚举的关联值
enum LineSegmentDescirptor {
    case StartAndEndPattern(start: Double, end: Double)
    case StartAndLengthPattern(start: Double, lenght: Double)
}
//都死描述同一个变量, 但是是描述同一个变量的两种不同的现象
var lsd = LineSegmentDescirptor.StartAndEndPattern(start: 10, end: 20)
lsd = LineSegmentDescirptor.StartAndLengthPattern(start: 10, lenght: 10)

switch lsd {
case .StartAndEndPattern(let s, let e): //<=> let .StartAndEndPattern(s, e):
    print("\(s) -> \(e)")
case .StartAndLengthPattern(let s, let l):
    print("start:\(s), length:\(l)")
}





