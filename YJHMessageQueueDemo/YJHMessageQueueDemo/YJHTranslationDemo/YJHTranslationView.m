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
    self.hidden = YES;
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 20, 20)];
    _label.font = [UIFont systemFontOfSize:13];
    _label.textColor = UIColor.blackColor;
    [self addSubview:_label];
}

- (void)showOperationViewDuration:(NSTimeInterval)during isFinish:(void (^)(BOOL))isFinish {
    self.hidden = NO;
    
    _label.text = [NSString stringWithFormat:@"%d", 3];
    [_label sizeToFit];
    
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    [self.layer addAnimation:animation forKey:@"push"];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(during * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CATransition *animation = [CATransition animation];
        animation.duration = 0.5;
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromTop;
        [self.layer addAnimation:animation forKey:@"push"];

        [UIView animateWithDuration:0.5 animations:^{
        } completion:^(BOOL finished) {
            self.hidden = YES;
            isFinish(YES);
        }];
    });
}

@end
