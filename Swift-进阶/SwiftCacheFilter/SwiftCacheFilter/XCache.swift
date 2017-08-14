//
//  XCache.swift
//  SwiftCacheFilter
//
//  Created by chao on 2017/5/4.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit

class XCache: NSObject {

    
    /// 读取缓存大小
    ///
    /// - Returns: 返回缓存大小
    static func returnCacheSize() -> String {
        return String(format: "%.2f", XCache.folderSizeAtPath(folderPath: NSHomeDirectory()))
        
    }
    
    
    /// 计算单个文件大小
    ///
    /// - Parameter path: 文件的路径
    /// - Returns: 返回文件大小
    static func returnFileSize(path: String) -> Double {
        let manger = FileManager.default
        var fileSize: Double = 0
        do {
//            fileSize = try manger.attributesOfItem(atPath: path)["FileSize"] as! Double
            
            fileSize = try manger.attributesOfItem(atPath: path)[FileAttributeKey.size] as! Double
        } catch  {
            
        }
        
        return fileSize / 1024 / 1024
    }
    
    
    /// 遍历所有子目录 并计算文件大小
    ///
    /// - Parameter folderPaht: 目录的路径
    /// - Returns: 返回文件大小
    static func folderSizeAtPath(folderPath: String) -> Double {
        let manage = FileManager.default
        if !manage.fileExists(atPath: folderPath) {
            return 0
        }
        let childFilePath = manage.subpaths(atPath: folderPath)
        var fileSize: Double = 0
        for path in childFilePath! {
            let fileAbsoluePath = folderPath + "/" + path
            fileSize += XCache.returnFileSize(path: fileAbsoluePath)
        }
        return fileSize
    }
    
    
    /// 清楚缓存
    static func cleanCache() {
        XCache.deleteFolder(path: NSHomeDirectory() + "/Documents")
        XCache.deleteFolder(path: NSHomeDirectory() + "/Library")
        XCache.deleteFolder(path: NSHomeDirectory() + "/tmp")
    }
    
    
    /// 删除单个文件
    ///
    /// - Parameter path: 文件路径
    static func deleteFile(path: String) {
        let manger = FileManager.default
        do {
            try manger.removeItem(atPath: path)
        } catch {
            
        }
    }
    
    
    /// 删除文件夹下所有文件
    ///
    /// - Parameter path: 文件夹路径
    static func deleteFolder(path: String) {
        let manage = FileManager.default
        if !manage.fileExists(atPath: path) {
            return
        }
        let childFilePath = manage.subpaths(atPath: path)
        for cpath in childFilePath! {
            let fileAbsoluePath = cpath + "/" + path
            XCache.deleteFile(path: fileAbsoluePath)
        }
    }
    
    
}
