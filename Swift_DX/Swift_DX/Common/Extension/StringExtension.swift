//
//  StringExtension.swift
//  Swift_DXDoctor
//
//  Created by chao on 2017/3/17.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var attributed: NSMutableAttributedString {
        get {
            let attritedStr = NSMutableAttributedString(string: self)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 6
            
            attritedStr.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, self.characters.count))
            
            return attritedStr
        }
    }
    
}
