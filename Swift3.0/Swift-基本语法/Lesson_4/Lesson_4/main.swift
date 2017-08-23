//
//  main.swift
//  Lesson_4
//
//  Created by 郭文超 on 16/8/7.
//  Copyright © 2016年 wenchao. All rights reserved.
//


/**
 *swift语言流程控制
 *三种基本结构: a.顺序执行, b.选择执行, c.循环执行,
 *(1)选择执行 --> 基于if
 *(2)循环执行 --> for /while /repeat - while
 *(3)选择执行 --> 基于switch
 */



import Foundation

print("**************基于if的选择执行*******************************")
/**
 *基于if的选择执行
 *格式: if 条件 {语句}
 *条件中的 () 可以不写
 *但是 if-else 后的 {} 一定要写
 */
let a = 10
let b = 19
var value: Int

//两个数中较大的一个
if a > b {
    value = a
}
else {
    value = b
}
print("较大的数是: \(value)")

value = a > b ? b : a
print(value)
print("较小的数是: \(value)")


print("**************white循环************************************")
/**
 *基于while的循环
  while 循环条件 {
        循环体
  }
 */

//执行1 + 2 + ... + 10
var i: Int = 0
var sum: Int = 0
while i < 10 {
    i += 1
    sum += i
}
print("while: sum = \(sum)")

print("**************基于repeat - while的循环**********************")
/**
 *基于repeat - while的循环
 repeat {
    循环体
 } while 循环条件
 */
i = 0
sum = 0
repeat {
    i = i + 1
    sum += i
} while i < 10
print("repeat - while: sum = \(sum)")

print("**************基于for的循环*********************************")
/**
 *基于for的循环
 for 初始化语句; 循环条件; 递增语句 {
    循环体
 }
 */
sum = 0
for i in 1..<10 {
    sum += i
}
//for var i = 1; i <= 10; i += 1 {
//    sum += i
//}
print("for: sum = \(sum)")

print("**************基于for - in的循环****************************")
/**
 *基于for - in 的循环
 *多用于区间运算符 和集合运算
 */
sum  = 0
for k in 1...10 {
    sum += k
}
print("for-in: sum = \(sum)")
for a in [1, 2, 3, 4, 5] {
    print("array: \(a)")
}
for a in [1 : "1", "2" : 2] as [AnyHashable : Any] {
    print("dic: \(a)")
}
for (a, b) in [1 : "1", 2 : "2"] {
    print("dic: a = \(a), b = \(b)")
}
//for a in "helloworld" {
//    print("char: \(a)")
//}

print("**************循环中的 break 和continue*********************")
/**
 *循环中的 break 和continue
 */
var array = [1, 3, 5, 7]
for a in array {
    if a % 5 == 0 {
        print(a)
        break
    }
    print(a)
}

print("**************switch语句***********************************")
/**
 *switch语句
 *不需要break来终止每一个case中的代码段
 *默认每一次都只执行一个case中的代码段
 *如果一个case中需要多个条件，那么每个条件之间用 , 隔开
 */
let str = ["2", "d", "1", "a", "3", "c",]
for c in str {
    switch c {
    case "1", "a":
        print("a")
//        break
    case "2" :
        print("b")
//        break
    default :
        print("error")
    }
}

print("**************switch广义的匹配*******************************")
/**
 *switch广义的匹配
 */

//和区间匹配
let x = 1000
switch x {
case 1...9:
    print("个位数")
case 10...99:
    print("十位数")
case 100...999:
    print("百位数")
case 1000...9999:
    print("千位数")
default:
    print("不匹配")
}

//和元组匹配
let point = (10, -10)
switch point {
case (0, 0):
    print("坐标原点")
case (1...10, 1...10):
    print("x和y坐标范围是位于1-10之间的")
case (_, 0):
    print("点在x轴上")
case (0, _):
    print("点在y轴上")
default:
    print("x和y坐标不在范围内")
}

print("**************switch的value bindings*******************************")
/**
*switch的值绑定
*/
switch point {
case (let x, 0):
    print("y = 0 : x = \(x)")
case (let x, 10):
    print("y = 10 : x = \(x)")
//case (let x, let y):
//    print("y = \(y) : x = \(x)")
case (let x, let y) where x == -y:
    print("y = \(y) : x = \(x)")
default:
    print("error")
}
/*
*(let x, 0), (let x, 10)这两个表示值绑定
*以 (let x, 0)为例，就是说当point的第二个元素为0的时候，我们就将point的第一个元素的值保存到x里面
*(let x, let y)这个也是值绑定，但是出现这个的时候将导致这种情况满足所有的情况，然后在这个case之后的所有case都将失效，包括default
*(let x, let y) where x == -y 这个后面的where x == -y表示给前面的两个常量加约束，保证它们只有在这种情况下才能走case中的代码段
**/


















