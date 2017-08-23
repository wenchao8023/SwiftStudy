//
//  NetWork.swift
//  Swift-MVVM(2)
//
//  Created by chao on 2017/4/24.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit
import Alamofire

let urlStr = "https://api.shunliandongli.com/v1/Home/all.json"

class NetWork: NSObject {
    
    var dataArray: NSMutableArray?
    

    func fetchSingerList() -> Void {
        
        Alamofire.request(urlStr).responsePropertyList { (result) in
            
        }
    }
    
//    Alamofire.request(urlStr).responseJSON { (returnResult) in
//    debugPrint("firstMethod --> responseJSON --> \(returnResult)")
//    if let json = returnResult.result.value {
//    print("firstMethod --> responseJSON --> \(json)")
    
    
    /*  返回请求地址、数据、和状态结果等信息
     print("firstMethod --> responseJSON() --> \(returnResult.request!)")
     print("firstMethod --> responseJSON() --> \(returnResult.data!)")
     print("firstMethod --> responseJSON() --> \(returnResult.result)")
     */
}
