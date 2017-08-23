

import Foundation

/**
 *(1)数组的概念和定义
 *本质是结构体
 *操作的时候一定不要越界
 *可变数组 和 不可变数组 分别对应的是 数组变量 和 数组常量
 */
print("*******数组的概念和定义************************************")
var array = [2, 3, 4, 5]
var array1: Array = [3, 4, 5, 6]
var array2: Array<Int> = [4, 5, 6, 7]
var array3: [Int] = [5, 6, 7, 8]
var array4: [Double] = [2.2, 3.3]
var array5: [String] = ["aa", "b"]
print(array)
print(array1)
print(array2)
print(array3)
print(array4)
print(array5)
//print(array + array1 + array2 + array3)

/**
 *(2)数组中可以存放不同类型的数据  主要是一些基本数据类型
 */
var array6 = [2.2, "aa", 5] as [Any]
var array7: Array<Any> = [3, 3.6, "bb"]

print(array6)
print(array7)

/**
 *(2)数组元素的访问、插入、增加
 */
//元素的访问，直接调用下标，不能越界
var array8 = [2, 3, 4]
print(array8[0])
//元素的插入
array8.append(5)    //在数组的尾部插入一个元素
print(array8)
array8.insert(6, at: 1)
print(array8)

/**
 *(3)数组元素的删除和修改
 */
var array9 = [1, 2, 3, 5, 6, 4, 7, 8, 9, 10]
array9[0] = 0               //直接修改第0位的元素
print("array9 = \(array9)")

array9.removeFirst()    //删除第一个元素
print("array9 = \(array9)")
array9.removeLast()     //删除最后一个元素
print("array9 = \(array9)")
array9.remove(at: 1) //删除指定位置的元素
print("array9 = \(array9)")
//保留数组容量删除数组中的所有元素    --> true
array9.removeAll(keepingCapacity: true)
print("array9 = \(array9)")
print("array9 = \(array9.capacity)")
//删除数组中的所有元素，同时也删除容量 --> false
array9.removeAll(keepingCapacity: false)
print("array9 = \(array9)")
print("array9 = \(array9.capacity)")



print("*******数组与slice****好像被废除了**************************")
//var slice: Slice<Int> = [5, 4, 3, 2, 1]


print("*******数组的批量操作************************************")
var array10 = [1, 2, 3, 4, 5]
array10[0...1] = [9, 9]
print(array10)
//将区间内的所有元素都换成这一个元素或者是多个元素，可以实现删除和增加的操作,但是区间不能越界
array10[0...1] = [8]
print(array10)
array10[0...1] = [7, 7, 7, 7]
print(array10)
array10[2...3] = []
print(array10)
array10[3...3] = [6]
print(array10)
array10.replaceSubrange((0 ..< 2), with: [2, 3, 4, 5, 6, 7]) //和区间替换一样的，可以多也可以少
print(array10)
array10 += [9]  //数组还可以做 + 运算，表示两个数组连接起来 <=>array10.append(9)
print(array10)

print("*******数组的遍历************************************")
for elm in array10 {
    print(elm)
}
//for (index, value) in enumerate(array10) {    enumerate() 方法已过期
//    print("index: \(index) = \(value)")
//}







/**
 *(1)字典的概念和定义 (key:value)
 *addr = hash(key)    value = hashTable[addr]
 *key 一定是hash 的，可以是 String/ Int/ Float/ Bool
 */
print("*******字典的概念和定义************************************")

var dic: Dictionary<AnyHashable, AnyHashable> = [:]   //定义一个空字典
dic = [1 : "1", 2 : "2"]
var dic1: Dictionary<String, Int> = ["3" : 3]
var dic2 = ["1" : 1, 2 : "2"] as [AnyHashable : Any]
print(dic)
print(dic1)
print(dic2)
print(dic2.count)   //获取字典中的 键值对 个数

/**
 *(1)字典的操作
 */
print("*******字典的操作************************************")
var dic3 = ["apple" : "苹果", "bag" : "包包"]
//根据 key 取字典里面的元素   结果是可选类型
//字典名称[key]
//字典名称[key]!
print(dic3["apple"]/*! + dic3["bag"]!*/)
print(dic3["apple"]!/*! + dic3["bag"]!*/)
print(dic3["apple"]! + dic3["bag"]!)

//修改对应key的值
dic3["apple"] = "梨子"
print(dic3)
dic3.updateValue("苹果", forKey: "apple")     //这个方法返回一个 可选类型
print(dic3)

//修改成功，返回修改之前 key对应的 值
if let rec = dic3.updateValue("橘子", forKey: "apple") {
    print(dic3)
    print(rec)
}
//如果修改失败也就是没有找到对应的key 那么就会返回 nil
if let rec = dic3.updateValue("西瓜", forKey: "app") {
    print(dic3)
    print(rec)
}

//添加键值对
dic3["an"] = "一个"
print(dic3)

//删除键值对，返回一个可选类型, 删除之前的key 对应的值
if let rec = dic3.removeValue(forKey: "an") {
    print(dic3)
    print(rec)
}

//字典的遍历
//遍历所有的 键值对
for (key, value) in dic3 {
    print("key:\(key) = \(value)")
}
//遍历所有的 key
for key in dic3.keys {
    print(key)
}
//遍历所有的 value
for value in dic3.values {
    print(value)
}

/**
*(1)range 与 区间运算符
*/
print("*******range 与 区间运算符************************************")
//var range: CountableRange<Int> = 1...3
var range1: CountableRange<Int> = 1..<3
var range2: CountableRange<Int> = 1..<3
//print(range)
print(range1)
print(range2)









