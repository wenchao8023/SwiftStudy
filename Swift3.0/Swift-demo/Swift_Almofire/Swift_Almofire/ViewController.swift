//
//  ViewController.swift
//  Swift_Almofire
//
//  Created by chao on 2017/4/14.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit
import Alamofire

let SERVICE_URL     = "http://v.juhe.cn/toutiao/index?"     // 请求地址
let SERVICE_IMG_URL = "https://httpbin.org/image/png"       // 图片 url
let APPKEY          = "ad2908cae6020addf38ffdb5e2255c06"    // 应用 APPKEY

let TOP             = "top"                                 // 参数：头条
let SHEHUI          = "shehui"                              // 参数：社会
let YULE            = "yule"                                // 参数：娱乐L



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView? = nil
    var dataArray: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataArray = ["响应链", "请求方式", "下载", "上传"]
        
        self.createUI()
        
    }
    
    func createUI() {
        
        tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView.init(frame: CGRect.zero)
        tableView?.tableHeaderView = UIView.init(frame: CGRect.zero)
        self.view .addSubview(tableView!)
        
        
        let textView: UITextView? = UITextView.init(frame: CGRect.init(x: 0,
                                                          y: 200, width: self.view.bounds.size.width,
                                                          height: self.view.bounds.size.height - 200)
        )
        textView?.tag = 200
        self.view.addSubview(textView!)
    }
    
    //MARK: 响应链 Response Handing 五种不同相应方式
    func Method1() {
        let urlStr = "\(SERVICE_URL)type=\(TOP)&key=\(APPKEY)"
        // 1. response()
        // 官方解释：The response handler does NOT evaluate any of the response data. It merely forwards on all information directly from the URL session delegate. It is the Alamofire equivalent of using cURL to execute a Request.
        Alamofire.request(urlStr).response { (response) in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                self.setText(str: "firstMethod --> response() --> utf8Text = \(utf8Text)")
            }
        }

        //  2. responseData()
        //  官方解释：The responseData handler uses the responseDataSerializer (the object that serializes the server data into some other type) to extract the Data returned by the server. If no errors occur and Data is returned, the response Result will be a .success and the value will be of type Data.
        Alamofire.request(urlStr).responseData { (returnResult) in
            debugPrint("firstMethod --> responseData() --> returnResult = \(returnResult)")
            if let data = returnResult.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("firstMethod --> responseData() --> utf8Text = \(utf8Text)")
            }
        }

        // 3. responseString()
        // 官方解释：The responseString handler uses the responseStringSerializer to convert the Data returned by the server into a String with the specified encoding. If no errors occur and the server data is successfully serialized into a String, the response Result will be a .success and the value will be of type String.
        Alamofire.request(urlStr).responseString { (returnResult) in
            debugPrint("firstMethod --> responseString() --> Sucess = \(returnResult.result.isSuccess)")
            print("firstMethod --> responseString() --> returnResult = \(returnResult)")
        }

        // 4. responseJSON()
        // 官方解释：The responseJSON handler uses the responseJSONSerializer to convert the Data returned by the server into an Any type using the specified JSONSerialization.ReadingOptions. If no errors occur and the server data is successfully serialized into a JSON object, the response Result will be a .success and the value will be of type Any.
        Alamofire.request(urlStr).responseJSON { (returnResult) in
            debugPrint("firstMethod --> responseJSON --> \(returnResult)")
            if let json = returnResult.result.value {
                print("firstMethod --> responseJSON --> \(json)")
                /*  返回请求地址、数据、和状态结果等信息
                 print("firstMethod --> responseJSON() --> \(returnResult.request!)")
                 print("firstMethod --> responseJSON() --> \(returnResult.data!)")
                 print("firstMethod --> responseJSON() --> \(returnResult.result)")
                 */
            }
        }

        // 5. responsePropertyList()
        // 官方解释：
        /*
         Alamofire.request(urlStr).responsePropertyList { (<#DataResponse<Any>#>) in
         <#code#>
         }
         */
        
        
        // 补充：1.参数：queue：请求队列 --> 就是默认在主线程中执行~但是我们可以自定义调度队列。
        // 官方解释：Response handlers by default are executed on the main dispatch queue. However, a custom dispatch queue can be provided instead.
        // 补充：2.关于请求返回结果验证这里就不说了~在我封装的项目中均有体现~亦或者可以参阅一下官方文档即可~
        let customQueue = DispatchQueue.global(qos: .utility)
        Alamofire.request(urlStr).responseJSON(queue: customQueue) { (returnResult) in
            print("firstMethod --> 请求队列 --> \(returnResult)")
        }

    }

    //MARK: 请求方法、参数、编码、请求头等
    func Method2() {
        /*
         public enum HTTPMethod: String {
         case options = "OPTIONS"
         case get     = "GET"
         case head    = "HEAD"
         case post    = "POST"
         case put     = "PUT"
         case patch   = "PATCH"
         case delete  = "DELETE"
         case trace   = "TRACE"
         case connect = "CONNECT"
         }
         */
        
        // 1. GET请求
        let urlStr = "\(SERVICE_URL)type=\(YULE)&\(APPKEY)"
        
        Alamofire.request(urlStr, method: .get).responseJSON { (result) in
            print("secondMethod --> GET 请求 --> returnResult = \(result)")
        }
        
        // 2. POST请求
        Alamofire.request(urlStr, method: .post).responseJSON { (result) in
            print("secondMethod --> POST 请求 --> returnResult = \(result)")
        }
        
        // 3. 参数、编码
        // 官方解释：Alamofire supports three types of parameter encoding including: URL, JSON and PropertyList. It can also support any custom encoding that conforms to the ParameterEncoding protocol.
        let param = [
            "type" : YULE,
            "key"  : APPKEY
        ]
        Alamofire.request(SERVICE_URL, method: .post, parameters: param).responseJSON { (result) in
            print("secondMethod --> 参数 --> returnResult = \(result)")
        }
        //Alamofire.request(SERVICE_URL, method: .post, parameters: param, encoding: URLEncoding.default)
        //Alamofire.request(SERVICE_URL, method: .post, parameters: param, encoding: URLEncoding(destination: .methodDependent))
        
        
        
        // 4.请求头
        let headers: HTTPHeaders = [
        "Accept" : "application/json"
        ]
        
        Alamofire.request(urlStr, headers: headers).responseJSON { (result) in
            print("secondMethod --> 请求头 --> returnResult = \(result)")
        }
    }
    
    // 下载
    func Method3() {
        
    }
    
    // 上传
    func Method4() {
        
    }
    
    func setText(str: String) {
        
        let textView: UITextView? = self.view.viewWithTag(200) as! UITextView?
        var textStr = textView?.text
        textStr = textStr?.appending("\n")
        textStr = textStr?.appending(str)
        textView?.text = textStr
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cellID")
        }
        
        cell?.textLabel?.text = dataArray![indexPath.row] as? String
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.perform(NSSelectorFromString("Method\(indexPath.row+1)"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

