//
//  XXFlashView.m
//  动画 Demo
//
//  Created by HN on 2020/9/12.
//  Copyright © 2020 HN. All rights reserved.
//

#import "BreathFlashView.h"
#import "NSTimer+Blocks.h"

static NSTimeInterval const defaultTime = 2.0f;

@interface BreathFlashView ()
/** 闪动的 view */
@property(nonatomic, strong) UIView *edgeView;
@property(nonatomic, strong) UIView *centerView;
/** 定时器 */
@property(nonatomic, strong) NSTimer *showTimer;

@end
@implementation BreathFlashView

#pragma mark - life
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        if (self.edgeWidth == 0) {
            self.edgeWidth = 40;
        }
        if (self.centerWidth == 0) {
            self.centerWidth = 10;
        }
    }
    return self;
}

- (void)dealloc {
    // 关闭定时器
    [self invalidateTimer];
}

#pragma mark - UI
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self begigFlashAnimation];
    [self prepareTimer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    self.edgeView.frame = CGRectMake(0, 0, self.edgeWidth, self.edgeWidth);
    self.centerView.frame = CGRectMake((width - self.centerWidth) * 0.5, (height - self.centerWidth) * 0.5, self.centerWidth, self.centerWidth);
}

#pragma mark - other
- (void)startFlashAnimation {
    [self prepareTimer];
}

- (void)stopFlashAnimation {
    [self invalidateTimer];
}

- (void)prepareTimer {
    if (self.showTimer) {
        [self invalidateTimer];
    }

    __weak typeof (self) weakSelf = self;
    self.showTimer = [NSTimer scheduledTimerWithTimeInterval:defaultTime
                                                       block:^{
        [weakSelf begigFlashAnimation];
    } repeats:YES];
}

- (void)invalidateTimer {
    [self.showTimer invalidate];
    self.showTimer = nil;
}

- (void)begigFlashAnimation {
    // 缩放 + 透明度动画
    self.edgeView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:3 animations:^{
        self.edgeView.transform = CGAffineTransformMakeScale(1,1);
        self.edgeView.alpha = 1.0;
        [UIView beginAnimations:@"flash" context:nil];
        [UIView setAnimationDuration:2];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        self.edgeView.alpha = 0;
        [UIView commitAnimations];
    }];
}

#pragma mark - set data
- (void)setCenterColor:(UIColor *)centerColor {
    _centerColor = centerColor;
    self.centerView.backgroundColor = centerColor;
}

- (void)setEdgeColor:(UIColor *)edgeColor {
    _edgeColor = edgeColor;
    self.edgeView.backgroundColor = edgeColor;
}

#pragma mark - get data
- (UIView *)edgeView {
    if (!_edgeView) {
        _edgeView =  [[UIView alloc] init];
        [self addSubview:_edgeView];
        _edgeView.backgroundColor = [UIColor whiteColor];
        _edgeView.alpha = 0;
    }
    return _edgeView;
}

- (UIView *)centerView {
    if (!_centerView) {
        _centerView =  [[UIView alloc] init];
        [self addSubview:_centerView];
        _centerView.backgroundColor = [UIColor whiteColor];
    }
    return _centerView;
}

- (void)setEdgeWidth:(CGFloat)edgeWidth {
    _edgeWidth = edgeWidth;
    
    self.edgeView.layer.cornerRadius = edgeWidth * 0.5;
}

- (void)setCenterWidth:(CGFloat)centerWidth {
    _centerWidth = centerWidth;
    
    self.centerView.layer.cornerRadius = centerWidth * 0.5;
}

@end
