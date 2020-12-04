//
//  YJHMessageQueueManger.m
//  YJHMessageQueueDemo
//
//  Created by yunjinghui on 2019/9/12.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "YJHMessageQueueManger.h"

@interface YJHMessageQueueManger ()
@property (readwrite, nonatomic, strong) NSOperationQueue *operationQueue;
@end


@implementation YJHMessageQueueManger

- (instancetype)init {
    if (self = [super init]) {
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 1;
    }
    return self;
}

- (NSUInteger)operationCount {
    return self.operationQueue.operationCount;
}

- (void)suspend {
    self.operationQueue.suspended = YES;
}

- (void)resume {
    self.operationQueue.suspended = NO;
}

@end
