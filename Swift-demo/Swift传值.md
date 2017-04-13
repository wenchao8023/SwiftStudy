# Swift中block、代理、通知、单例传值

## block传值

定义一个闭包实现**block**主要分三步：

1. 定义一个闭包类型
格式: `typealias 闭包名称 = (参数名称: 参数类型) -> 返回值类型`
`typealias swiftBlock = (_ str: String) -> Void `

2. 声明一个变量 `var callBack: swiftBlock?`
3. 定义一个**方法**, 方法的参数为和swiftBlock类型一致的闭包,并赋值给callBack，这个方法很重要，最后在其他地方调用的就是这个方法，而不是block对象

		func callBackBlock(block: @escaping (_ str: String) -> Void) {
	        callBack = block
	   }

使用这个闭包

- 在当前类实现

        if callBack != nil {
            callBack!("这里的闭包传递了一个字符串")
        }
        
- 在其他类接受

 		other.callBackBlock{ (str) in
 		
 		}
> 与其说是block，不妨说是代理，因为理解起来更像代理
> 
> 在 **A类** 中定义闭包并调用这个闭包，然后再将这个闭包作为一个函数的参数对外提供
> 
> 这个时候，在 **B类** 中实现这个函数，然后等待 **A类** 中传值给这个闭包，一旦这个闭包被调用，就会触发 **B类** 中的这个函数，实现传值
> 
> 所以说，这个逻辑更像oc中的代理，只不过比代理要稍微方便一点，不用遵循代理，直接调用这个函数就等价于代理里面的`遵循代理 + 实现代理方法`


## 代理传值

### 制定协议

1. 制定协议(不写NSObjectProtocol暂时不会报错,但是写属性是无法写weak)
	
		protocol TestDelegate: NSObjectProtocol {
		    // 设置协议方法
		    func delegateMethod1(result: UIColor, num: Int)
		}
		
2. 用weak定义代理

	    weak var myDelegate: TestDelegate?
	    
3. 判断代理是否存在,让代理去执行方法

	    func lastClick() {
	       
	        myDelegate?.delegateMethod1(result: UIColor.cyan, num: 3)
	        self.navigationController?.popViewController(animated: true)
	    }


### 遵守协议

1. 遵守协议

		class ViewController1: UIViewController, TestDelegate {
		
2. 设置代理为 `self`		

		vc3.myDelegate = self
		
3. 实现协议方法

		func delegateMethod1(result: UIColor, num: Int) {
	        self.view.backgroundColor = result
	        print("接收到的数字是: \(num)")
	    }
	    
从这个过程可以看出来，Swift中的代理和oc中的代理一毛一样，还是那么麻烦，后面还有更麻烦的，代理中**可选方法**的修饰

* 修饰可选方法

		@objc protocol TestDelegate: NSObjectProtocol {
		    
		    // 设置协议方法
		    func delegateMethod1(result: UIColor, num: Int)
		    
		    
		    @objc optional func optionalMethod()
		}
在指定协议的前面加上`@objc`, 然后用 `@objc optional` 来修饰可选方法即可


### 通知传值

#### 通知发送方

1. 通知名称常量

	    let notifyChatMsgRecv = NSNotification.Name(rawValue: "notifyChatMesRecv")
	    
	因为给通知命名的时候不再单单是一个字符串了，而是`NSNotification.Name(rawValue: "notifyChatMesRecv")`用这个来表示`name`，所以我们在要建立通知的时候，可以将所有通知的`name`全部创建在一起，然后统一分配使用
	
2. 发送通知

		let userInfo: Dictionary = ["color" : UIColor.yellow, "num" : "4"] as [String : Any]
		NotificationCenter.default.post(name: notifyChatMsgRecv, object: nil, userInfo: userInfo)
		
#### 通知接收方

1. 接受通知
		
	方法一
	
		NotificationCenter.default.addObserver(
			self,                                     
			selector:#selector(notifyMethod(notify:)),   
			name:NSNotification.Name(rawValue: "notifyChatMesRecv"),                                               
			object: nil
			)
			
	实现对应的方法
	
		func notifyMethod(notify: NSNotification) {
	        
	        if let dic:Dictionary = notify.userInfo {
	            
	            let color: UIColor = dic["color"] as! UIColor
	            let num: String = dic["num"] as! String
	            
	            self.view.backgroundColor = color
	            print("接收到的数字是: \(num)")
	        }
	    }

	方法二
	
		NotificationCenter.default.addObserver(
	            forName:NSNotification.Name(rawValue: "notifyChatMesRecv"),
	            object: nil,
	            queue: nil) { (notification) in
	                if let dic:Dictionary = notification.userInfo {
	                    
	                    let color: UIColor = dic["color"] as! UIColor
	                    let num: String = dic["num"] as! String
	                    
	                    self.view.backgroundColor = color
	                    print("接收到的数字是: \(num)")
	                }
	
	        }

2. 释放通知

		deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name(rawValue: "notifyChatMesRecv"),
            object: nil)
    	}
    	
	总的来说，Swift通知和oc通知并没有多大区别。同样的在Swift中，也有`print("notify.name is \(notify.name)\nnotify.obj is \(notify.object)")`属性，所以可以放心的使用通知
	
### 单例传值

> 单例传值就更简单了，就是用一个单例将需要全局保存的值保存下来，比如用户的登录信息（token、sig验证），比如App版本信息，这些都可以用`UserDefaults`来保存的。如果不需要用沙盒路径保存的信息，可以用单例类来保存，比如给`appDelegate`添加一个`testColor`属性，使用` (UIApplication.shared.delegate as! AppDelegate).testColor = UIColor.orange`这个就可以拿到或者是编辑这个信息了。


总的来说，Swift中的基本传值方式就是这四种，其实与oc中的并没有多大区别，毕竟都是一家子人写出来的语法。
