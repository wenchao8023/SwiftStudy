

/********************************************
 *                  Func                    *
 ********************************************/
 
import Foundation

/**
 *(1)函数的定义和调用
 *函数声明
 func 函数名(参数名:参数类型, 参数名:参数类型, ...) -> 函数返回值类型 {
 函数体
 }
 *函数调用
 函数名(实际参数)
 */
print("******************函数的定义和调用************************")
func showIntegerArray(_ array: [Int]) {
    for a in array {
        print("showIntegerArray \(a) ")
    }
}
showIntegerArray([1, 2, 3, 4, 5])

/**
 *(2)函数的参数和返回值
 *  1.函数可以有多个参数
 *  2.函数可以没有参数也可以没有返回值
 *  3.函数可以有多个返回值
 */
print("******************函数的参数和返回值************************")
func maxOfValue(_ a : Int, b : Int) -> Int {
    return a > b ? a : b
}
let a = 3
let b = 5
let c = maxOfValue(a, b: b)
print("Max value between \(a) and \(b) is \(c)")

//没有返回值的时候 -> 要省略
func showHelloWorld() {
    print("Hello World")
}
showHelloWorld()

//参数是元组类型
func getLengthAndWidth(_ p0: (Double, Double),  p1: (Double, Double)) -> (Double, Double) {
    return (abs(p0.1 - p1.1), abs(p0.0 - p1.0))
}
let p0: (Double, Double) = (1, 2)
let p1: (Double, Double) = (5, 6)
print(getLengthAndWidth(p0, p1: p1))

func getLengthAndWidth1(_ p0: (Double, Double),  p1: (Double, Double)) -> (length: Double, width: Double) {
    return (abs(p0.0 - p1.0), abs(p0.1 - p1.1))
}
let w = getLengthAndWidth1(p0, p1: p1).width
let l = getLengthAndWidth1(p0, p1: p1).length
print("width = \(w), length = \(l)")

func getLengthAndWidth2(_ p0: (x: Double, y: Double),  p1: (x: Double, y: Double)) -> (length: Double, width: Double) {
    return (abs(p0.x - p1.x), abs(p0.y - p1.y))
}
let ww = getLengthAndWidth2(p0, p1: p1).width
let ll = getLengthAndWidth2(p0, p1: p1).length
print("width = \(ww), length = \(ll)")


/**
 *(3)函数的内部参数和外部参数
 */
print("******************函数的内部参数和外部参数************************")
func divisionOperation(_ dividend: Double, divisor: Double) -> Double {
    return dividend / divisor
}
let div = divisionOperation(3.5, divisor: 1.2)
print(div)

//dividend是外部参数, a是内部参数, 在函数内部的时候使用内部参数
func divisionOperation1(dividend a: Double, divisor b: Double) -> Double {
    return a / b
}
//在调用的时候显示告诉使用者参数需要一个什么样的数, 表示什么意思, 显示出来的是函数的外部参数
let div1 = divisionOperation1(dividend: 3.4, divisor: 1.2)
print(div1)

//函数内部参数和外部参数的简写
func divisionOperation2(dividend: Double, divisor: Double) -> Double {
    return dividend / divisor
}
let div2 = divisionOperation2(dividend: 3.6, divisor: 1.2)
print(div2)
//不能使用#了，直接在第一个参数那里使用 外部+内部 参数定义, 在第二个参数及其以后的参数使用一个定义就可以了
func divisionOperation3(sum1: Double, sum2: Double, sum3: Double) -> Double {
    return sum1 + sum2 + sum3
}
let div3 = divisionOperation3(sum1: 1, sum2: 2, sum3: 1)
print(div3)


/**
 *(4)函数的默认参数
 */
print("******************函数的默认参数************************")
//函数的默认参数在定义的时候给定，在调用的时候不需要传递这个参数，直接省略不写就可以了
//但如果给了默认参数的位置传递了参数，那么使用传递的参数
func joinString(_ s1: String, toString: String, joinString: String = "?") -> String {
    return s1 + joinString + toString
}
print(joinString("hello", toString: "world"))

var tempStr = joinString("hello", toString: "world", joinString: "#")
print(tempStr)


/**
 *(5)函数的常量参数和变量参数
 */
 print("***************函数的常量参数和变量参数*******************")
//执行之后程序报错，表示函数的默认参数类型是常量型的, 也就是let, 如果要当做变量使用，需要显示声明为var
//func swap(a: Int, b:Int) {
//    let t = a
//    a = b
//    b = t
//}
func swap(_ a: Int, b: Int) {
    var a = a, b = b
    let t = a
    a = b
    b = t
}


/**
 *(6)输入输出函数inout
 */
print("***************输入输出函数inout*******************")
var x = 10
var y = 19
//这两个函数都是同一个函数签名
swap(x, b: y)   //传入的是实参的值的时候不会引起实参的值的改变
print("x = \(x), y = \(y)")
swap(&x, &y)    //传入的是实参的地址, 可以改变实参的值
print("x = \(x), y = \(y)")

//使用inout, 显式声明为输入输出函数
func swap1(_ a: inout Int, b: inout Int) {
    let t = a
    a = b
    b = t
}
swap1(&x, b: &y)
print("x = \(x), y = \(y)")

/**
 *(7)变参函数
 */
print("***************变参函数****************************")
//使用数组作为参数来实现变参(参数的个数)
func add(_ array: [Int]) -> Int {
    var sum = 0
    for a in array {
        sum += a
    }
    
    return sum
}
print(add([1, 2, 3, 4, 5]))

//当参数的个数不确定, 参数的类型都是一样的时候，可以采用array: Int...的类型来构造参数, 使用的时候可以将array当做一个数组使用
//【注意】参数array: Int... 必须放在参数列表的最末尾
func add1(_ array: Int...) -> Int {
    var sum = 0
    for a in array {
        sum += a
    }
    
    return sum
}
print(add1(1, 2, 3, 4, 5, 6))



/**
 *(8)函数类型
 *  函数类型变量 /常量
 *  函数类型参数
 *  函数类型返回值
 */
print("***************函数类型****************************")
func addNew(_ a: Int, b: Int) -> Int {
    return a + b
}
func subNew(_ a: Int, b: Int) -> Int {
    return a - b
}
//由(Int, Int) -> Int, 也就是参数列表和返回值类型来决定函数类型, 如果这两个一样就表示函数类型是一样的
var calFunc: (Int, Int) -> Int = addNew     //类似函数指针
print(calFunc(3, 5))
calFunc = subNew
print(calFunc(3, 5))

//函数类型做参数
func calFunc1(_ a: Int, b: Int, op: (Int, Int) -> Int) ->Int {
    return op(a, b)
}
print(calFunc1(3, b: 5, op: addNew))
print(calFunc1(3, b: 5, op: subNew))

//函数类型做返回值
func max(_ a: Int, b: Int) ->Int {
    return a > b ? a : b
}
func min(_ a: Int, b: Int) ->Int {
    return a > b ? b : a
}
//返回值类型是函数类型
func chooseFunc(getMax: Bool) ->((Int, Int) ->Int) {
    return getMax ? max : min
}
//myFunc是一个变量, 类型是(Int, Int) ->Int的函数类型, 这个时候的myFunc具有这个函数类型的签名，也就是参数列表和返回值类型
var myFunc: (Int, Int) ->Int = chooseFunc(getMax: true)
print(myFunc(2, 9))
myFunc = chooseFunc(getMax: false)
print(myFunc(2, 9))

















