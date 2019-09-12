//
//  YJHTranslationView.m
//  YJHMessageQueueDemo
//
//  Created by yunjinghui on 2019/9/12.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "YJHTranslationView.h"

@implementation YJHTranslationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.opaque = NO;
    self.hidden = YES;
}

- (void)showOperationViewDuration:(dispatch_time_t)during isFinish:(void (^)(BOOL))isFinish {
    self.hidden = NO;
    //    self.transform = CGAffineTransformMakeTranslation(-self.frame.size.width, 0);
    
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = @"push";
    animation.subtype = kCATransitionFromTop;
    [self.layer addAnimation:animation forKey:@"animation"];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(during * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.alpha = 0;
            CATransition *animation = [CATransition animation];
            animation.duration = 0.5;
            animation.type = @"push";
            animation.subtype = kCATransitionFromTop;
            [self.layer addAnimation:animation forKey:@"animation"];
            
            self.alpha = 1;
            
            self.hidden = YES;
            isFinish(YES);
        });
    });

}

@end