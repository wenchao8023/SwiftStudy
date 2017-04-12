//
//  FirViewController.h
//  MiXCode_OC_In_Swift
//
//  Created by chao on 2017/4/12.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Myblock)(NSString *arg);

@interface FirViewController : UIViewController

//@property (copy, nonatomic) Myblock myBlock;
//这种作为公共参数的形式，如果在Swift类中去回调的话，是有问题的。提示没有初始化方法，所以使用下面的以Block为参数的方法
- (void)transValue:(Myblock) block;

@end
