# Swift和Objective-C混编
**前言**

Swift已推出数年，与Objective-C相比Swift的语言机制及使用简易程度上更接地气，大大降低了iOS入门门槛。当然这对新入行的童鞋们来讲，的确算是福音，但对于整个iOS编程从业者来讲，真真是，曾几何时“高大上”，转瞬之间“矮矬穷”。再加上培训班横行，批量批发之下，iOS再也看不到当年的辉煌。

![](http://img.knowledge.csdn.net/upload/base/1452496101906_906.jpg)	![](http://img.knowledge.csdn.net/upload/base/1477273962202_202.jpg)

往事不再提，事还是要做滴。iOS10推出后，紧跟着Xcode8也推送了更新，细心者会发现，Xcode8下iOS版本最低适配已变为iOS8.0，加上Swift版本趋于稳定，从某种意义上讲，Swift的时代正式开启，替代Objective-C怕也只是时间问题。当然，在这之前，我们也应做好准备。今年越来的越多的公司，也开始了Swift和Objective-C混编。

我们今天就来看看两者混编中的一些注意事项及问题：

---
混编

混编也无非两种情况，

- 在Objective - C工程或者文件使用Swift的文件；
- 在Swift工程或者文件使用Objective - C文件

---

#### 在混编的过程中最重要的两个文件：

##### 1. 桥接文件：

> 桥接文件“ProjectName-Bridging-Header.h”，在首次创建其他文件的时候，会自动生成。如果不小心删除后，也可以手动添加，不过名字必须是“ProjectName-Bridging-Header.h”头文件（名称组成:`工程名-Bridging-Header.h`），如果名字记不清也可以自己新建Header file后，在`Targets-->Build Settings-->Swift Compiler - General-->Objective-C Bridging Header`配置文件路径，这个文件主要是Swift使用OC类时使用。


##### 2. Objective-C Generated Interface Header Name文件

> 这个文件是混编时，系统生成的Swift文件对应的Objective-C的头文件，具体可以在`Targets-->Build Settings-->Swift Compiler - General-->Objective-C Generated Interface Header Name`进行配置，默认文件名是`工程名-Swift.h`，一般不做改动。
 
##### - 在Objective - C工程或者文件使用Swift的文件

> 当在OC文件中调用Swift文件中的类的时候，首先在OC文件中要加上 #import "
ProjectName-swift.h”(名字组成:工程名-swift)

> 这个文件虽然在工程中看不到，但是它真实存在，编译后，你可以按住Command+单击该文件名，就会看到具体生成的代码。
引入后，具体类的使用，直接按照OC的方式使用即可。

##### - 在Swift工程或者文件使用Objective - C文件

> 当在Swift中使用OC文件的时候，只需在桥接文件即projectName-Bridging-Header.h文件中引入需要的头文件。
具体使用，按照对应的Swift语法结构来即可。

#### 混编注意事项

##### 1. 对于需要混编的Swift类添加@objc声明或继承NSObject或NSObject的子类

	class TestClass
	{
	// 属性
	// 实现
	}

如果要在Objective-C类中使用TestClass类，应当使用@objc加以声明，或者将TestClass继承自NSObject或NSObject的子类，否则，引入ProductName-Swift.h之后，程序找不到对应类。

##### 2. 使用第三方Framework

* 设置： `target-->build setting -->Packaging -->Defines Module`为 “Yes”；
* 然后，配置文件`Target -> Build Phases -> Link Binary`，添加要导入的Framework；
* 最后，还是要配置桥接文件，比如要使用 `abc-lib.framework`库中的 `abc.h` 就要这样配置：`#import"abc-lib/abc.h`";

##### 3. Subclass子类问题

对于自定义的类而言，Objective-C的类，不能继承自Swift的类，即要混编的OC类不能是Swift类的子类。反过来，需要混编的Swift类可以继承自OC的类。[[注解]](https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html#//apple_ref/doc/uid/TP40014216-CH10-ID122)

#### 4. OC宏文件

如Swift文件要使用OC中定义的宏，只能使用常量简单宏文件。

#### 5. Swift独有特性

Swift中有许多OC没有的特性，比如，Swift有元组、为一等公民的函数、还有特有的枚举类型。所以，要使用的混编文件要注意Swift独有属性问题。

### 案例之Swift中使用OC的block

Swift中使用Closure不能使用Block作为属性进行传值，必须是初始化方法或函数。
**Objective-C文件中：**

	#import <UIKit/UIKit.h>
	
	typedef void (^Myblock)(NSString *arg); 
	
	@interface FirViewController : UIViewController 
	//@property (copy, nonatomic) Myblock myBlock; 
	//这种作为公共参数的形式，如果在Swift类中去回调的话，是有问题的。提示没有初始化方法，所以使用下面的以Block为参数的方法 
	
	- (void)transValue:(Myblock) block;
	
	@end

**下面是.m文件**

	#import "FirViewController.h" 
	@implementation FirViewController 
	
	- (void)viewDidLoad 
	{ 
	    [super viewDidLoad]; 
	    self.view.backgroundColor = [UIColor whiteColor]; 
	} 
	
	- (void)transValue:(Myblock)block
	{ 
	    if (block) 
	    { 
	        block(@"firBack"); 
	    } 
	} 
	@end

**在Swift文件回调：**

在Swift使用OC的类时，首先在桥接文件中声明oc的头文件
工程名-Bridging-Header.h这是创建Swift工程的情况下

	import UIKit 
	class ViewController: UIViewController 
	{ 
	   override func viewDidLoad() 
	    { 
	        super.viewDidLoad() 
	        self.view.backgroundColor = UIColor.whiteColor() 
	    } 
	    @IBOutlet weak var goFirst: UIButton! 
	    @IBAction func goFirstAction(sender: AnyObject) 
	    { 
	        let firVC:FirViewController = FirViewController() 
	        firVC. transValue { ( arg:String !) -> Void in 
	            self.aBtn?.setTitle(arg, forState: UIControlState.Normal)
	        } 
	        self.navigationController?.pushViewController(firVC, animated: true) 
	    }
	}	

