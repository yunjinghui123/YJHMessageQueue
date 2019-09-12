//
//  YJHMessageOperation.m
//  YJHMessageQueueDemo
//
//  Created by yunjinghui on 2019/9/12.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "YJHMessageOperation.h"

@interface YJHMessageOperation ()
@property (nonatomic, weak) id<YJHMessageQueueDelegate> animationView;
@property (nonatomic, assign) dispatch_time_t time;
@end

@implementation YJHMessageOperation {
    BOOL _isExecuting;
    BOOL _isFinished;
}

- (instancetype)init {
    if (self = [super init]) {
        _isExecuting = NO;
        _isFinished = NO;
        _time = 2.f;
    }
    return self;
}

- (instancetype)initWithAnimationView:(id<YJHMessageQueueDelegate>)animationView duration:(dispatch_time_t)time {
    if (self = [super init]) {
        self.animationView = animationView;
        self.time = time;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    return self;
}

- (void)becomeActive {
    [self finishedChange];
}

- (BOOL)isConcurrent {
    return YES;
}

- (BOOL)isExecuting {
    return _isExecuting;
}

- (BOOL)isFinished {
    return _isFinished;
}

- (void)finishedChange {
    [self willChangeValueForKey:@"isFinished"];
    _isFinished = YES;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)executingChange {
    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)start {
    @try {
        if (self.isCancelled) {
            [self finishedChange];
            return;
        }
        [self executingChange];
        __weak typeof(self) wSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.animationView showOperationViewDuration:self.time isFinish:^(BOOL isFinish) {
                __strong typeof(wSelf) strongSelf = wSelf;
                if (strongSelf != self) {
                    return ;
                }
                [self finishedChange];
            }];
        });
    } @catch (NSException *exception) {
        
    }
}



@end
