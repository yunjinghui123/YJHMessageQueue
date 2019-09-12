//
//  YJHMessageQueueDelegate.h
//  YJHMessageQueueDemo
//
//  Created by yunjinghui on 2019/9/12.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#ifndef YJHMessageQueueDelegate_h
#define YJHMessageQueueDelegate_h

@protocol YJHMessageQueueDelegate <NSObject>

@optional

/// 自定义view调用，用户展示外部动画时间，完成状态
/// @param during 动画需要展示的时间
/// @param isFinish 本次动画是否完成
- (void)showOperationViewDuration:(dispatch_time_t)during isFinish:(void (^)(BOOL isFinish))isFinish;

@end


#endif /* YJHMessageQueueDelegate_h */
