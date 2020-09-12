//
//  NSTimer+Blocks.h
//
//  Created by HN on 2020/9/12.
//  Copyright © 2020 HN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Blocks)

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                         block:(void (^)(void))inBlock
                                       repeats:(BOOL)inRepeats;

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                block:(void (^)(void))inBlock
                              repeats:(BOOL)inRepeats;

@end
