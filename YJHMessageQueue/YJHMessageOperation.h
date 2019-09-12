//
//  YJHMessageOperation.h
//  YJHMessageQueueDemo
//
//  Created by yunjinghui on 2019/9/12.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YJHMessageQueueDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface YJHMessageOperation : NSOperation

/// 初始化 operation 对象，是放入queue的一条消息
/// @param animationView 动画的内容，自定义view
/// @param time 动画展示的时间
- (instancetype)initWithAnimationView:(id<YJHMessageQueueDelegate>)animationView duration:(dispatch_time_t)time;

@end

NS_ASSUME_NONNULL_END
