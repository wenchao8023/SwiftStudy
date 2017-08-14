//
//  ViewController.swift
//  SwiftSQLite
//
//  Created by chao on 2017/5/3.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    var db:Connection! = nil    // db 的路径
    let users = Table("users")  // 创建 users 表
    let id = Expression<Int64>("id")    // id 属性
    let name = Expression<String>("name")   // name 属性
    let email = Expression<String>("email") // email 属性
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            // 沙盒根目录
            let path = NSHomeDirectory() + "/Documents/db.sqlite3"
            print(path)
            db = try Connection(path)
            try db.run(users.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(email)
            })
        } catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var i: Int64 = 0

    @IBAction func insert(_ sender: Any) {
        do {
            i = i + 1
            let insert = users.insert(id <- i, name<-"StrongX", email<-"28938239@qq.com")
            try db.run(insert)
        } catch {
            print(error)
        }
    }
    
    @IBAction func del(_ sender: Any) {
        do {
            try db.run(users.delete())
        } catch {
            print(error)
        }
    }
    
    @IBAction func update(_ sender: Any) {
        do {
            try db.run(users.update(email <- email.replace("28938239@qq.com", with: "haha@sb.com")))
        } catch {
            print(error)
        }
    }
    
    @IBAction func search(_ sender: Any) {
        do {
            for user in try db.prepare(users) {
                print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
            }
        } catch {
            print(error)
        }
    }
    

}

