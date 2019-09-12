//
//  ViewController.m
//  YJHMessageQueueDemo
//
//  Created by yunjinghui on 2019/9/12.
//  Copyright © 2019 yunjinghui. All rights reserved.
//

#import "ViewController.h"

#import "YJHTranslationView.h"
#import "YJHScrollView.h"
#import "YJHMessageQueue.h"

@interface ViewController ()
@property (nonatomic, strong) YJHMessageQueueManger *manager;

@property (nonatomic, strong) YJHScrollView *scrollView;
@property (nonatomic, strong) YJHTranslationView *translationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.translationView];
}

- (IBAction)translation:(UIButton *)sender {
    for (int i = 0; i < 4; i++) {
        YJHMessageOperation *operation = [[YJHMessageOperation alloc] initWithAnimationView:self.translationView duration:i];
        [self.manager.operationQueue addOperation:operation];
    }

}
- (IBAction)scroll:(UIButton *)sender {
    for (int i = 0; i < 4; i++) {
        YJHMessageOperation *operation = [[YJHMessageOperation alloc] initWithAnimationView:self.scrollView duration:i];
        [self.manager.operationQueue addOperation:operation];
    }

}

- (YJHTranslationView *)translationView {
    if (_translationView == nil) {
        _translationView = [[YJHTranslationView alloc] initWithFrame:CGRectMake(0, UIScreen.mainScreen.bounds.size.height - 350, 240, 80)];
        _translationView.backgroundColor = UIColor.greenColor;
    }
    return _translationView;
}

- (YJHScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[YJHScrollView alloc] initWithFrame:CGRectMake(0, UIScreen.mainScreen.bounds.size.height - 350, 240, 80)];
        _scrollView.backgroundColor = UIColor.brownColor;
    }
    return _scrollView;
}


- (YJHMessageQueueManger *)manager {
    if (_manager == nil) {
        _manager = [[YJHMessageQueueManger alloc] init];
    }
    return _manager;
}

@end
