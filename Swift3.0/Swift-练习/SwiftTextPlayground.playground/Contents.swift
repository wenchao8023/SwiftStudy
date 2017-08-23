//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground";

/**
 *  练习一 显示创建一个常量 Float型 初始值为4
 */
let LX1_explicitFloat: Float = 4;

/**
 *  练习二 查看错误提示
 */
let LX2_label = "The width is ";
let LX2_width = 94;
let LX2_widthLabel = LX2_label + String(LX2_width);
//let LX2_widthLabel = LX2_label + LX2_width; error

/**
 *  练习三 \(a) 将 a 转成字符串
 */
let LX3_float: Float = 4.23;
let LX3_result = "hello \(LX3_float) swift.";

/**
 *  练习四 可选值类型为nil的判断
 */
var LX4_optName: String? = nil;
if let name = LX4_optName {
    print("hello \(name)");
}
else
{
    print("hello who are you.");
}

LX4_optName = "swift";
if let name = LX4_optName {
    print("hello \(name)");
}
else
{
    print("hello who are you.");
}

/**
 *  page10
 */



