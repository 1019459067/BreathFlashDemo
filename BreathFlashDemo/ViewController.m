//
//  ViewController.m
//  BreathFlashDemo
//
//  Created by HN on 2020/9/12.
//  Copyright © 2020 HN. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  

}
- (IBAction)onAction:(UIButton *)sender {
    TestViewController *vc = [TestViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
