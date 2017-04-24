//
//  ViewController2.m
//  StoryBoardOfSegue
//
//  Created by chao on 2017/4/7.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)unwindFromSegue:(UIStoryboardSegue *)segue {
    
    NSLog(@"%@", NSStringFromClass([segue.sourceViewController class]));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
