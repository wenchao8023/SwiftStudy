//
//  WCCommonUtil.h
//  InitNewProject
//
//  Created by chao on 2017/4/26.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCCommonUtil : NSObject
/**
 *  判断是不是第一次进入这个版本
 */
+(BOOL)isFirstBuildVersion;

/**
 *  改变状态栏的颜色为白色
 */
+(void)changeStateBarWhite;

/**
 *  改变状态栏的颜色为黑色
 */
+(void)changeStateBarBlack;

@end
