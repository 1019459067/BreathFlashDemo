//
//  TestViewController.m
//  BreathFlashDemo
//
//  Created by HN on 2020/9/12.
//  Copyright © 2020 HN. All rights reserved.
//

#import "TestViewController.h"
#import "BreathFlashView.h"

@interface TestViewController ()
@property(nonatomic, strong) BreathFlashView *flashView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blackColor;
    
    BreathFlashView *flashView = [[BreathFlashView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2., (self.view.frame.size.height-100)/2., 100, 100)];
    [self.view addSubview:flashView];
    flashView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    
    flashView.centerColor = UIColor.greenColor;
    flashView.edgeColor = UIColor.orangeColor;
    flashView.edgeWidth = 100;
    flashView.centerWidth = 20;
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
