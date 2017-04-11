# 可选类型

## 文章（一）

声明变量或常量的时候，代表可以有值，也可以无值。在类型标注后面，用？表示当其没有值时可以赋值nil

#### 如果一个变量和常量是非可选类型的话，不能赋值为nil

		let assumedString: String? = nil //可以被赋值为nil
		let implicitString: String = nil //不可以
	
#### 如果要判断一个非可选类型的变量或常量是否为空，不能这样判断 xxx != nil

		let forcedString:String = possibleString!
		let implicityString:String = "hello"
		if implicitString != nil { //不能这样判断，会报错
		}
		
## 文章（二）
[来源](http://www.cocoachina.com/swift/20160810/17330.html?utm_source=tuicool&utm_medium=referral)

### Optional Type总览

#### 什么是optional? 
> Swift中声明的一个变量时, 默认情况下它是non-optional的, 即必须赋予这个变量一个非空的值. 如果给non-optional类型的变量赋值nil, 编译器就会报错。

	var string1: String = "This is string1" // OK
	string1 = nil  // Nil cannot be assigned to type 'String'
	- Swift中, 当声明一个类的属性时, 属性默认也是non-optional的
	swift
	class MyClass {
	    var name: String = "Lv"
	    var age: String  // Class 'MyClass' has no initializers
	}

> 对于之前使用Objective-C的同学来说, 这样的错误可能会让你们有些惊讶, 因为在Objective-C中, 当把nil赋值给一个变量或者声明一个没有初始值的属性时, 编译器都不会报错.

	NSString *string1 = @"This is string1";
	string1 = nil;
	class MyClass {
	    NSString *name = @"Lv"
	    NSString *age;
	}
	
> 然而并不意味着在Swift中不能声明一个没有初始值的属性. Swift中引入了可选类型(optional type)来解决这一问题. 它的定义是通过在类型生命后加加一个`?`操作符完成的.
	class MyClass {
	    var name: String?  // OK
	    var age: String?  // OK
	}
	
	
#### 为什么引入可选类型?

Swift是一门安全的编程语言. 正如苹果所言, 可选类型就是证明Swift是一门安全的编程语言的一个小例子. 如上面的例子所示, Swift的可选类型提供了在编译阶段就检查一些可能在运行时才会出现的常见错误的机制. 下面通过下面的例子更好的诠释一下可选类型的威力.

> 考虑下面一个Objective-C中的方法

	- (NSString *)findStockCode:(NSString *)company {
	    if ([company isEqualToString:@"Apple"]) {
	        return @"AAPL";
	    } else if ([company isEqualToString:@"Google"]) {
	        return @"GOOG";
	    }
	    return nil;
	}
- 通过`findStockCode:`方法可以传入公司的名字,然后得到对应公司的股票代码. 为了方便演示, 这里只返回Apple和Google的代码, 对于其他的传入参数, 统统返回nil.
- 假设在同一个类中调用`findStockCode:`方法:

		NSString *stockCode = [self findStockCode:@"Facebook"]; // nil is returned
		NSString *text = @"Stock Code - ";
		NSString *message = [text stringByAppendingString:stockCode]; // runtime error
		NSLog(@"%@", message);

- 上面的代码是可以编译通过的, 但是因为传入了"Facebook"导致返回值是nil, 当代码开始运行后, 程序就会报错了
- 当使用**Swift**中的可选类型时, 上面在运行时才会出现的错误在**编译阶段**就会报错. 如果使用Swift的代码重写上面的例子,代码如下:

		func findStockCode(company: String) -> String? {
		   if (company == "Apple") {
		      return "AAPL"
		   } else if (company == "Google") {
		      return "GOOG"
		   }
		   return nil
		}
		var stockCode:String? = findStockCode("Facebook")
		let text = "Stock Code - "
		let message = text + stockCode  // compile-time error
		print(message)
		
- stockCode被定义成可选类型. 这就意味着它要么是一个String, 要么就是nil. 因为编译器在编译阶段就检测到了潜在的错误(可选类型的值没有被解包: value of optional type String? is not unwrapped)并且提示你去改正, 这段代码就不能够被执行.
- 从这个例子中可以看到, Swift的可选类型加强了对空值的检查, 并且在编译阶段就给开发者提供了可能的错误信息. 很明显, 可选类型的引入可以让代码的质量变得更好.

#### 解包可选类型(Unwrapping Optionals)

如何让上面的代码正常运行? 很明显, 这里需要判断stockCode是否为空. 代码如下:

	var stockCode:String? = findStockCode("Facebook")
	let text = "Stock Code - "
	if stockCode {
	    let message = text + stockCode!
	    print(message)
	}

- 像在Objective-C中一样, 还是使用if来判断stockCode中是否有值. 一旦确定stockCode中肯定有值时, 将一个感叹号(!)加在可选类型变量名后面来解包这个可选类型的变量. 在Swift中, 这叫做硬解包. 即直接在可选类型后面加一个感叹号来表示它肯定有值.
- 上面的例子中, 我们只是自己知道stockCode肯定有值, 所以才直接硬解包了stockCode变量. 但是万一有时候我们的感觉是错的, 那程序在运行时可能会出现严重的错误. 所以Swift中是推荐先检查可选类型是否有值, 然后再进行解包的!

		var stockCode:String? = findStockCode("Facebook")
		let text = "Stock Code - "
		let message = text + stockCode!  // runtime error
		
	【注意】以上代码在编译阶段不会报错.**因为使用了硬解包, 编译器认为可选类型是有值的，** 所以编译是通过的. 当代码运行起来时, 知名的错误将会出现: `fatal error: Can’t unwrap Optional.None`

#### 可选绑定(Optional Binding)

- 与硬解包不同, 可选绑定(Optional Binding)是一种更简单更推荐的方法来解包一个可选类型. 使用可选绑定来检查可选类型的变量有值还是没值. 如果有值, 解包它并且将值传递给一个常量或者变量.
- 再多的言语描述也不如直接上代码来的实际! 将上面的代码改成可选绑定的代码如下:

		var stockCode:String? = findStockCode("Facebook")
		let text = "Stock Code - "
		if let tempStockCode = stockCode {
		    let message = text + tempStockCode
		    print(message)
		}
		
 `if let`或者`if var`是可选绑定的两个关键字. 使用自然语言来描述上面这段代码的话, 意思就是如果stockCode有值,解包它,并且将它的值赋值给tempStockCode, 然后执行下面的条件语句; 如果stockCode为空, 直接跳过条件语句块.		
	**等价于<==>**
	
		let text = "Stock Code - "
		if var stockCode = findStockCode("Apple") {
	    	let message = text + stockCode
	    	print(message)
		}
- 这里stockCode不再是可选类型, 所以不需要使用`!`来解包. 如果findStockCode:方法返回值是nil, 那么程序并不会执行条件语句块中的代码.

#### 可选链式调用(Optional Chaining)

- 在解释optional chaining之前, 先来修改一下上面的例子. 这里重新创建一个名为Stock的类, 包含两个可选类型的属性code和price. `findStockCode:`方法直接返回Stock类的对象, 而不再是String.

		class Stock {
		    var code: String?
		    var price: Double?
		}
		func findStockCode(company: String) -> Stock? {
		    if (company == "Apple") {
		        let aapl: Stock = Stock()
		        aapl.code = "AAPL"
		        aapl.price = 90.32
		        return aapl
		    } else if (company == "Google") {
		        let goog: Stock = Stock()
		        goog.code = "GOOG"
		        goog.price = 556.36
		        return goog
		    }
		    return nil
		}
		
	改写了创建类的代码, 相应的调用代码也需要修改. 这里调用findStockCode:方法得到一个Stock对象, 然后计算买100股股票所需的价格.
	
		if let stock = findStockCode("Apple") {
		    if let sharePrice = stock.price {
		        let totalCost = sharePrice * 100
		        print(totalCost)
		    }
		}	
		
	这里因为findStockCode:方法的返回值类型是可选类型, 所以使用if let进行可选绑定, 又因为price属性也是可选类型, 所以再使用一个if let来判断是否有值.
	
	上面的代码是一段正确的代码. 但是可以通过使用可选链式调用(Optional Chaining)来简化上面的代码, 毕竟上面是使用了两个if let的. 可选链式调用使我们能够通过`?.`链接多个可选类型. 示例代码如下:
	
	**等价于<==>**
	
		if let sharePrice = findStockCode("Apple")?.price {
		    let totalCost = sharePrice * 100
		    print(totalCost)
		}	

	可选链式调用提供了另外一种方法获得price的值. 现在的代码看起来更加简洁. 这里只是对可选链式调用(Optional Chaining)做了简要介绍, 详细的介绍请阅读[苹果官方文档](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-XID_312)。
	
#### Swift和Objective-C的互通性

- Swift的可选类型是非常强大的. 尽管可能需要花一段时间熟悉它的语法.

- Swift的设计是本着可以和Objective-C的API交互的原则. 当你想和UIKit或者其他框架的API交互时, 你肯定得需要可选类型. 下面是一些在实现table view时遇见的可选类型.

		func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
		   // Return the number of sections.
		   return 1
		}
		func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
		   // Return the number of rows in the section.
		   return recipes.count
		}
		func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		   let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
		   cell.textLabel.text = recipes[indexPath.row]
		   return cell
		}
		
#### 总结

理解可选类型的工作原理是非常重要的，在Swift中可选类型允许开发者能够在代码的编译阶段就发现一些潜在的问题, 从而确保在代码真正运行时能更安全. 一旦等你习惯了它的语法, 你必将会爱上可选类型这个新引入的概念。