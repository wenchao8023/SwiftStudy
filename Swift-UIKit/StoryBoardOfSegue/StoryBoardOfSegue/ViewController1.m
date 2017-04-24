//
//  ViewController1.m
//  StoryBoardOfSegue
//
//  Created by chao on 2017/4/7.
//  Copyright © 2017年 ibuildtek. All rights reserved.
//

#import "ViewController1.h"

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self performSegueWithIdentifier:@"goToTwo" sender:self];
}

-(IBAction)unwindFrom:(UIStoryboardSegue *)segue {
    
    UIViewController *sourceVC = segue.sourceViewController;
    
    if ([sourceVC isKindOfClass:[ViewController2 class]]) {
        NSLog(@"coming from v2");
    } else {
        NSLog(@"coming from v3");
    }
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
