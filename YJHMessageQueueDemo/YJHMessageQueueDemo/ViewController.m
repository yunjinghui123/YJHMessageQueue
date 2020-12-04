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


#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

@interface ViewController ()
@property (nonatomic, strong) YJHMessageQueueManger *manager;

@property (nonatomic, strong) YJHScrollView *scrollView;
@property (nonatomic, strong) YJHTranslationView *translationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.translationView];
    [self.view addSubview:self.scrollView];
}

- (IBAction)translation:(UIButton *)sender {
    YJHMessageOperation *operation = [[YJHMessageOperation alloc] initWithAnimationView:self.translationView];
    [self.manager.operationQueue addOperation:operation];
}

- (IBAction)scroll:(UIButton *)sender {
    YJHMessageOperation *operation = [[YJHMessageOperation alloc] initWithAnimationView:self.scrollView];
    [self.manager.operationQueue addOperation:operation];

}

- (YJHMessageQueueManger *)manager {
    if (_manager == nil) {
        _manager = [[YJHMessageQueueManger alloc] init];
    }
    return _manager;
}


- (YJHScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[YJHScrollView alloc] initWithFrame:CGRectMake(0, UIScreen.mainScreen.bounds.size.height - 350, 240, 80)];
        _scrollView.backgroundColor = kRandomColor;
    }
    return _scrollView;
}

- (YJHTranslationView *)translationView {
    if (_translationView == nil) {
        _translationView = [[YJHTranslationView alloc] initWithFrame:CGRectMake(0, UIScreen.mainScreen.bounds.size.height - 350, 240, 80)];
        _translationView.backgroundColor = kRandomColor;
    }
    return _translationView;
}


@end
