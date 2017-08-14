//
//  XGIFView.swift
//  SwftShowGIF
//
//  Created by chao on 2017/5/4.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import UIKit
import ImageIO
import QuartzCore

class XGIFView: UIView {
    private var gifUrl: NSURL!
    private var totalTime: Float = 0
    private var imageArray: Array<CGImage> = []
    private var timeArray: Array<NSNumber> = []
    
    /// 本地加载gif图
    ///
    /// - Parameter name: gif图名称
    func showGIFImageWithLocalName(name: String) {
        gifUrl = Bundle.main.url(forResource: name, withExtension: "gif") as NSURL!
    }
    
    func createFrame() {
        let url: CFURL = gifUrl as CFURL
        let gifSource = CGImageSourceCreateWithURL(url, nil)
        let imageCount = CGImageSourceGetCount(gifSource!)
        for i in 0..<imageCount {
            let imageRef = CGImageSourceCreateImageAtIndex(gifSource!, i, nil)
            imageArray.append(imageRef!)
            
            let sourceDict = CGImageSourceCopyPropertiesAtIndex(gifSource!, i, nil) as NSDictionary!
            let gifDict = sourceDict?[String(kCGImagePropertyGIFDictionary)]
            let time = gifDict[String(kCGImagePropertyGIFDelayTime)] as? NSNumber
            timeArray.append(time)
            totalTime += time.floatValue
        }
        
        self.showAnimation()
    }
    
    func showAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "contents")
        var current: Float = 0
        var timeKeys:Array<NSNumber> = []
        for time in timeArray {
            
        }
    }

}
