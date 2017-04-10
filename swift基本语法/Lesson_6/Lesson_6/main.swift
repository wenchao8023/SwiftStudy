
/*****************
 *      闭包      *
 *****************/

import Foundation

/**
 *(1)闭包的概念和分类
 *   自闭包的函数代码块
 *   全局闭包（有名）
 *   闭包表达式（匿名）-- 能捕获上下文中的常量和变量
 *   嵌套函数（*）
 */

/**
 *(2)闭包表达式的语法
 *      函数:         func funcName(参数列表) ->返回值类型 {}
 *      闭包表达式:    {}    是匿名的, 有参数列表和返回值类型
 *      格式:         {   (参数列表) ->返回值类型 in
 *                          执行语句
 *                    }
 */

//定义一个常量sayHello, 类型是 {}闭包表达式类型, 这种将闭包赋值给一个常量的方法用的很少
let sayHello = {
    print("hello World!")
}
//调用闭包
sayHello()

let add = { (a: Int, b: Int) ->Int in
    return a + b
}
/*<=>
    let add: (Int, Int) ->Int = { (a: Int, b: Int) ->Int in
        return a + b
    }
 */
print(add(2, 3))

/**
 *(3)闭包表达式的调用
 */
var array = [25, 43, 1, 53, 54]
func showArray() {
    print(array)
}
func bubbleSort(inout array: [Int]) {
    let cnt = array.count
    for var i = 0; i < cnt; i++ {
        for var j = i + 1; j < cnt; j++ {
            if (array[i] > array[j]){
                let t = array[i]
                array[i] = array[j]
                array[j] = t
            }
        }
    }
}

//showArray()
//bubbleSort(&array)
//showArray()

func bubbleSort1(inout array: [Int], cmp: (Int, Int) ->Int) {
    let cnt = array.count
    for var i = 0; i < cnt; i++ {
        for var j = i + 1; j < cnt; j++ {
            if (cmp(array[i], array[j]) == -1){
                let t = array[i]
                array[i] = array[j]
                array[j] = t
            }
        }
    }
}
//let intCmp = {
//    (i: Int, j: Int) ->Int in
//    return i > j ? -1 : (i == j ? 0 : 1)
//}

//只需要更改比较策略就可以了
let intCmp = {
    (i: Int, j: Int) ->Int in
    return i%10 > j%10 ? -1 : (i%10 == j%10 ? 0 : 1)
}
//showArray()
//bubbleSort1(&array, cmp: intCmp)
//showArray()


/**
 *(4)闭包表达式的优化
 */
func bubbleSort2(inout array: [Int], cmp: (Int, Int) ->Int) {
    let cnt = array.count
    for var i = 0; i < cnt; i++ {
        for var j = i + 1; j < cnt; j++ {
            if (cmp(array[i], array[j]) == -1){
                let t = array[i]
                array[i] = array[j]
                array[j] = t
            }
        }
    }
}
//showArray()
//bubbleSort2(&array,cmp: {
//    (i, j) ->Int in     //(i, j)不给类型，让类型推断去推断类型
//    return i%10 > j%10 ? -1 : (i%10 == j%10 ? 0 : 1)
//})
//showArray()

//为了书写方便, 往往将闭包表达式作为函数形参的最后一个参数书写
func bubbleSort3(inout array: [Int], cmp: (Int, Int) ->Int) {
    let cnt = array.count
    for var i = 0; i < cnt; i++ {
        for var j = i + 1; j < cnt; j++ {
            if (cmp(array[i], array[j]) == -1){
                let t = array[i]
                array[i] = array[j]
                array[j] = t
            }
        }
    }
}
showArray()
//省略参数名和返回值类型, 用$0, $1来表示参数列表中的参数, 从左到右依次是%0, %1, %2, ...
bubbleSort3(&array,cmp: {
    return $0%10 > $1%10 ? -1 : ($0%10 == $1%10 ? 0 : 1)
})
showArray()


/**
 *(5)尾随闭包
 */

//如果只有一条语句的时候, 可以省略return $0 > $1 中的return
//sort(&array, {
//    $0 > $1
//}
//当闭包作为最后一个参数的时候, 可以将闭包写在参数列表外面
//sort(&array) { $0 > $1 }


/**
 *(6)嵌套函数
 */
func bubbleSortFunction(inout array: [Int]) {
    let cnt = array.count
    sortBubble(&array, cnt: cnt)
    
}
func sortBubble(inout array: [Int], cnt: Int) {
    for var i = 0; i < cnt; i++ {
        for var j = i + 1; j < cnt; j++ {
            if (array[i] > array[j]){
                swapValue(&array[i], b: &array[j])
            }
        }
    }
}
func swapValue(inout a: Int, inout b: Int) {
    let t = a
    a = b
    b = t
}
showArray()
bubbleSortFunction(&array)
showArray()


/**
 *(7)闭包值捕获
 */
func getIncFunc(inc: Int) ->(Int) ->Int {
    var mt = 10
    func incFunc(v: Int) ->Int {
        mt++
        return inc + v + mt
    }
    
    return incFunc
}
let incFunc1 = getIncFunc(3)
//调用getIncFunc(3)之后, getIncFunc()方法中的变量inc本应该被销毁, 但是被方法incFunc()保留了, 具体的参考函数的管理方式--栈的管理方式
print("\nincFunc1 = \(incFunc1)")
print("incFunc1 = \(incFunc1(10))")
print("incFunc1 = \(incFunc1(10))")
print("incFunc1 = \(incFunc1(10))\n")











