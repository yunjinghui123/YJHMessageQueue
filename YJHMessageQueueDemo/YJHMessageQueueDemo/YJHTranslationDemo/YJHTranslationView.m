//
//  YJHTranslationView.m
//  YJHMessageQueueDemo
//
//  Created by yunjinghui on 2019/9/12.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "YJHTranslationView.h"

@implementation YJHTranslationView {
    UILabel *_label;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.opaque = NO;
    self.hidden = YES;
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 20, 20)];
    _label.font = [UIFont systemFontOfSize:13];
    _label.textColor = UIColor.blackColor;
    [self addSubview:_label];
}

- (void)showOperationViewDuration:(NSTimeInterval)during isFinish:(void (^)(BOOL))isFinish {
    self.hidden = NO;
    //    self.transform = CGAffineTransformMakeTranslation(-self.frame.size.width, 0);
    
    _label.text = [NSString stringWithFormat:@"%llu", during];
    [_label sizeToFit];
    
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
