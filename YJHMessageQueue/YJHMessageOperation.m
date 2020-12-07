//
//  YJHMessageOperation.m
//  YJHMessageQueueDemo
//
//  Created by yunjinghui on 2019/9/12.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "YJHMessageOperation.h"

@interface YJHMessageOperation ()
@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished)  BOOL finished;
@property (assign, nonatomic, getter = isCancelled) BOOL cancelled;
@property (nonatomic, weak) id<YJHMessageQueueDelegate> animationView;
@end

@implementation YJHMessageOperation

@synthesize executing = _executing;
@synthesize finished  = _finished;
@synthesize cancelled = _cancelled;

- (instancetype)init {
    if (self = [super init]) {
        [self complete];
    }
    return self;
}

- (instancetype)initWithAnimationView:(id<YJHMessageQueueDelegate>)animationView {
    if (self = [super init]) {
        self.animationView = animationView;
    }
    return self;
}

- (void)start {
    @synchronized (self) {
        if (self.isCancelled) {
            self.finished = YES;
            return;
        }
        
        self.finished = NO;
        self.executing = YES;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak __typeof__(self) weakSelf = self;
            [self.animationView showOperationWithFinish:^(BOOL isFinish) {
                __typeof__(weakSelf) self = weakSelf;
                if (isFinish) {
                    [self complete];
                } else {
                    [self cancel];
                }
            }];
        });
    }
}

- (void)complete {
    @synchronized (self) {
        if (self.isExecuting) {
            self.finished = YES;
            self.executing = NO;
        }
    }
}

- (void)cancel {
    @synchronized (self) {
        [super cancel];
        if (self.isExecuting) {
            self.cancelled = YES;
            [self complete];
        }
    }
}

- (BOOL)isConcurrent {
    return YES;
}

- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)setCancelled:(BOOL)cancelled {
    [self willChangeValueForKey:@"isCancelled"];
    _cancelled = cancelled;
    [self didChangeValueForKey:@"isCancelled"];
}

@end
