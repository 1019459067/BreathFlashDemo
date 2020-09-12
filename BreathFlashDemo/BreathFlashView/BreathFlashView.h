//
//  XXFlashView.h
//  动画 Demo
//
//  Created by HN on 2020/9/12.
//  Copyright © 2020 HN. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 使用定时器 + UIView动画实现
 */
@interface BreathFlashView : UIView

@property (strong, nonatomic) UIColor *centerColor;
@property (strong, nonatomic) UIColor *edgeColor;

@property (assign, nonatomic) CGFloat edgeWidth;
@property (assign, nonatomic) CGFloat centerWidth;

/**
 开始呼吸动画
 */
- (void)startFlashAnimation;

/**
 结束呼吸动画
 */
- (void)stopFlashAnimation;
@end
