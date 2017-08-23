//
//  main.swift
//  Lesson_9
//
//  Created by 郭文超 on 16/8/12.
//  Copyright © 2016年 wc. All rights reserved.
//


/*----------------------属性---------------------------*/

import Foundation

/**
 *(1)存储属性
 */
struct Person {
    var name: String
    var age: Int
    func description() {
        print("<# isa: Person, name = \(name), age = \(age)#>")
    }
}
//声明变量的时候 如果成员变量没有初始化的话 就必须要使用逐一成员构造方法来定义变量
var p = Person(name: "zhangSan", age: 20)
p.description()
p.age = 21
p.name = "liSi"
p.description()

class Person1 {
    var name = "zhangSan"
    var age = 20
    func description() {
        print("<#isa: Person1, name = \(name), age = \(age)#>")
    }
}
//如果在定义结构体的时候初始化了成员变量, 这个时候可以直接用不带参数的构造方法来定义变量
var zhangSan = Person1()
print(zhangSan.description())



/**
 *(2)常量存储属性
 *  对于一些不可修改的属性一般会声明为常量
 */
class Person2 {
    let name = "zhangSan"
    var age = 20
    func description() {
        print("<#isa: Person2, name = \(name), age = \(age)#>")
    }
}


/**
 *(3)结构体常量或类常量与存储属性
 */
struct Person3 {
    var age: Int
    let name: String = "zhangsan"
}
let p_xianWu = Person3(age: 20)
//p_xianWu.age = 10         提示 p_xiaowu 是let, 不能被修改
//p_xianWu.name = "dawu"    提示 name     是let, 不能被修改, 就是说先判断属性, 然后再判断结构体变量, 顺序是从里到外
//结构体的常量属性只要在第一次有值之后, 都不能修改, 这里的第一次可以是在声明结构体时声明变量之后直接初始化, 也可以是这里没有给值, 在创建变量的时候使用逐一成员构造方法的时候给的值, 只要let属性第一次有值之后就不会再允许被修改, 这里的逐一成员构造函数里面的参数很明显比结构体属性个数要少, 因为常量属性已经初始化了, 不再需要被修改, 而且let声明的常量属性也不允许被修改
/*结构体常量属性的声明位置
 *(1)在定义结构体的里面声明的时候就直接初始化
 *      这种情况下的结构体在创建变量的时候, 逐一成员构造函数里面的参数将不再有这个参数, 只有没有初始化的成员变量, 初始化之后就不在允许被修改
 *(2)定义结构体的时候没有初始化, 在创建结构体变量的时候初始化的
 *      这个时候在结构体创建变量的时候, 需要在逐一成员构造函数里面将这个参数初始化, 而且是必须初始化, 同样的初始化之后就不在允许被修改
 **/

class CPerson3 {
    var age: Int = 0
    let name: String = "zhangsan"
}
var c_p: CPerson3 = CPerson3()
let c_p1 = CPerson3()
c_p = c_p1
/*总结:
 *结构体常量对象, 它本身是一个常量, 其对应的对象不能被修改
 *类常量对象, 它本身是一个常量, 它对应的对象可以通过修改它来修改     ---- 怎么修改?
 *结构体或枚举:   值
 *类        :   引用
 **/


/**
 *(4)延迟存储属性
 *  swift语言中的所有存储属性都必须要有初始值, 也就是当构造一个类或者结构体的对象之后, 对象中的所有存储属性都必须要有初始值, ---- 唯一例外的就是延迟存储属性
 *  可以将属性的初始化向后推迟到该属性第一次被调用的时候
 *      1.延迟属性不适合一开始就初始化, 取决于外部的很多因素
 *      2.属性可能从来都用不到, 但是它的初始化有需要较长的时间
 *      3.相较于 懒加载 来理解, 再使用的时候在初始化, 不用就不需要初始化
 */
print("********************延迟存储属性*******************")
struct MyStudent {
    var name: String
    var chinese: Double
    var math: Double
    func showMySelf() {
        print("<#isa: MyStudent, 姓名: \(name), 语文成绩: \(chinese), 数学成绩: \(math)#>")
    }
}

class MyClass {
    var members: [MyStudent] = []
    //所有学生的平均成绩, 最开始的时候不需要初始化, 只有在使用的时候才知道值是多少
    lazy var score: Double = self.getScore()
//    var score: Double = self.getScore()   这个是不允许的, lazy表示在使用的时候才会有self, 然后才能调用
    func getScore() ->Double {
        print("test lazy property")
        var temp:Double = 0
        for i in members {
            temp += i.chinese
            temp += i.math
        }
        if members.count > 0{
            return temp / Double(members.count)
        }
        else {
            return 0
        }
    }
    
    func description() {
        for i in members {
            i.showMySelf()
        }
    }
}
let s0 = MyStudent(name: "zhangSan", chinese: 85, math: 95)
let s1 = MyStudent(name: "liSi", chinese: 90, math: 90)
let c0 = MyClass()
c0.members.append(s0)
c0.members.append(s1)

c0.description()
print("**************")
print(c0.score)
//print("The average score is \(c0.getScore())")


/**
 *(5)计算属性
 *  1.swift中的计算属性不直接存储值, 跟存储属性不同, 没有任何的"后端存储与之对应"
 *  2.计算属性用于计算, 可以实现setter和getter这两种计算方法
 *  3.枚举中不允许有存储属性, 但可以有计算属性
 *  4.计算属性只能是 var
 *      setter  对象.属性  = 某个值
 *      getter  let value = 对象.属性
 */
print("********************计算属性***********************")
struct MyRect {
    var origin: (x: Double, y: Double) = (0, 0)
    var size: (w: Double, h: Double) = (0, 0)
//    声明计算属性
    var center: (x: Double, y: Double) {
        get {
            return (rect.origin.x + rect.size.w / 2, rect.origin.y + rect.size.h / 2)
        }
        set {    //在set方法中, 直接跟一个名称就可以了set(n), 不需要设置类型,    如果不跟名称的话, 就用newValue来代替
            //center是一个计算属性, 不能够直接对center赋值, 所以需要对它的get方法中能够改变它的值的属性来赋值, 这样再调用这个属性的get方法的时候, 它自身的值也会发生改变, 将能够改变它的值存储在计算它的存储属性里面
//            origin.x = n.x - size.w / 2
//            origin.y = n.y - size.h / 2
            origin.x = newValue.x - size.w / 2
            origin.y = newValue.y - size.h / 2
        }
    }
    
    func description() {
        print("<#isa: MyRect, origin: \(origin), size: \(size), center: \(center)#>")
    }
}
var rect = MyRect()
rect.origin = (0, 0)
rect.size   = (100, 100)    //setter
//rect.center = (rect.origin.x + rect.size.w / 2, rect.origin.y + rect.size.h / 2)
rect.description()
rect.center = (100, 100)
rect.description()



/**
 *(6)只读计算属性
 */
print("********************只读计算属性***********************")

struct MyStudent1 {
    var name: String
    var chinese: Double
    var math: Double
    func showMySelf() {
        print("<#isa: MyStudent1, 姓名: \(name), 语文成绩: \(chinese), 数学成绩: \(math)#>")
    }
}

class MyClass1 {
    var members: [MyStudent1] = []
    //所有学生的平均成绩, 最开始的时候不需要初始化, 只有在使用的时候才知道值是多少
//    lazy var score: Double = self.getScore()
    //    var score: Double = self.getScore()   这个是不允许的, lazy表示在使用的时候才会有self, 然后才能调用
    
    //上面的延迟属性score很显然可以用计算属性来表示, 由于average这个属性只需要被访问就可以了, 所以就只给get方法, 也就是只读计算属性
    //简写    省略get{} 关键字
    var average: Double {
        get {
            var temp:Double = 0
            for i in members {
                temp += i.chinese
                temp += i.math
            }
            if members.count > 0{
                return temp / Double(members.count)
            }
            else {
                return 0
            }
        }
    }
    
    func description() {
        for i in members {
            i.showMySelf()
        }
    }
}

var myS0 = MyStudent1(name: "xiaoWu", chinese: 60, math: 80)
var myS1 = MyStudent1(name: "daWu", chinese: 80, math: 70)
var myC0 = MyClass1()
myC0.members.append(myS0)
myC0.members.append(myS1)
print("avarage = \(myC0.average)")


/**
 *(7)属性观察器
 *  观察属性的变化, 是指属性被修改时可以调用我们事先写好的代码去额外执行一些操作, 类似于OC中的 KVO机制
 *  两种属性观察器
 *  1.willSet   在设置新值的时候调用
 *  2.didSet    在新值已经设置好之后调用
 *  可以为除lazy属性之外的存储属性添加属性观察器
 *  也可以在继承类中为父类的计算属性添加属性观察器
 *  很显然是一种回调, 可以理解为回调通知, 在这两个回调里面设置界面刷新的操作应该会很多
 */
print("********************属性观察器***********************")

struct MyRect1 {
    var origin: (x: Double, y: Double) = (0, 0) {
        willSet {
            print("willSet: \(newValue)")   //将要修改成的一个新值
        }
        didSet {
            print("didSet: \(oldValue)")    //修改之前的值
        }
    }
    var size: (w: Double, h: Double) = (0, 0)
    //    声明计算属性
    var center: (x: Double, y: Double) {
        get {
            return (rect.origin.x + rect.size.w / 2, rect.origin.y + rect.size.h / 2)
        }
        set {    //在set方法中, 直接跟一个名称就可以了set(n), 不需要设置类型,    如果不跟名称的话, 就用newValue来代替
            //center是一个计算属性, 不能够直接对center赋值, 所以需要对它的get方法中能够改变它的值的属性来赋值, 这样再调用这个属性的get方法的时候, 它自身的值也会发生改变, 将能够改变它的值存储在计算它的存储属性里面
            //            origin.x = n.x - size.w / 2
            //            origin.y = n.y - size.h / 2
            origin.x = newValue.x - size.w / 2
            origin.y = newValue.y - size.h / 2
        }
    }
    
    func description() {
        print("<#isa:MyRect1, origin: \(origin), size: \(size), center: \(center)#>")
    }
}
var rect1 = MyRect1()
rect1.description()
rect1.origin = (1, 1)
rect1.description()



/**
 *(8)类型属性
 *  1.也就是为 "类" 本身定义属性, 这样的属性不隶属于某一个 "对象", 可以认为是这个类的所有对象实例所公有的属性
 *  2.结构体或枚举可以定义存储或计算型 "类型属性", 而类只能定义计算型 "类型属性"     ----    现在的版本里面类已经可以定义定义存储型类型属性了, 关键字也可以是static, 也可以是class
 *      对象.属性
 *      类名.属性
 */
print("\n********************类型属性***********************")
struct TypeProperty {
    var property: Int = 0
    //存储型类型属性
    static var staticProperty: Int = 0
    //计算型类型属性
    static var staticCalculateProperty: Int {
        return TypeProperty.staticProperty + 1
    }
    func description() {
        print("<#isa: TypeProperty, property: \(property), staticProperty: \(TypeProperty.staticProperty), staticCalculateProperty: \(TypeProperty.staticCalculateProperty)#>")
    }
}

var obj = TypeProperty()
var obj1 = TypeProperty()
obj1.property = 20
obj.property = 10
//obj.staticProperty = 10
TypeProperty.staticProperty = 10
obj.description()

class TypeProperty1 {
    var property: Int = 0
    //存储型类型属性
    static var staticProperty: Int = 0
    //计算型类型属性
    static var staticCalculateProperty: Int {
        return TypeProperty1.staticProperty + 1
    }
    class var classProperty: Int {
        return TypeProperty1.staticProperty + 2
    }
    func description() {
        print("<#isa: TypeProperty1, property: \(property), staticProperty: \(TypeProperty1.staticProperty), staticCalculateProperty: \(TypeProperty1.staticCalculateProperty), classProperty: \(TypeProperty1.classProperty)#>")
    }
}
var obj2 = TypeProperty1()
obj2.property = 30
obj2.description()

print("\n")




