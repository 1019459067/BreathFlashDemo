//
//  NSTimer+Blocks.m
//
//  Created by HN on 2020/9/12.
//  Copyright © 2020 HN. All rights reserved.
//

#import "NSTimer+Blocks.h"

@implementation NSTimer (Blocks)

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                         block:(void (^)(void))inBlock
                                       repeats:(BOOL)inRepeats {
    void (^block)(void) = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                block:(void (^)(void))inBlock
                              repeats:(BOOL)inRepeats {
    void (^block)(void) = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+ (void)jdExecuteSimpleBlock:(NSTimer *)inTimer {
    if([inTimer userInfo]) {
        void (^block)(void) = (void (^)(void))[inTimer userInfo];
        block();
    }
}

@end
