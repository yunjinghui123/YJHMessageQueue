//
//  YJHMessageQueueManger.h
//  YJHMessageQueueDemo
//
//  Created by yunjinghui on 2019/9/12.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJHMessageQueueManger : NSObject

/// oprationQueue 消息通道，储存显示的全部消息
@property (readonly, nonatomic, strong) NSOperationQueue *operationQueue;

/// 操作数量
- (NSUInteger)operationCount;

/// 暂停队列
- (void)suspend;

/// 继续队列
- (void)resume;

@end

NS_ASSUME_NONNULL_END
