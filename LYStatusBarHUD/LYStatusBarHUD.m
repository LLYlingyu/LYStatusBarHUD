//
//  LYStatusBarHUD.m
//  LYStatusBarHUD
//
//  Created by mac mini on 2017/5/31.
//  Copyright © 2017年 宁波力拓信息科技有限公司. All rights reserved.
//

#import "LYStatusBarHUD.h"

#define LYMessageFont [UIFont systemFontOfSize:14]

// 消息显示\隐藏的动画时间
static CGFloat const LYMessageDuration = 2.0;
// 消息显示\隐藏的动画时间
static CGFloat const LYAnimationDuration = 0.25;

@implementation LYStatusBarHUD

// 全局窗口
static UIWindow *window_;
// 全局定时器
static NSTimer *timer_;

// 初始化窗口
+ (void)showWindow {
    window_.hidden = YES;

    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, 20);
    
    // 添加窗口
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor blackColor];
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:LYAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

// 显示成功信息
+ (void)showSuccess:(NSString *)message {
    [self showMessage:message image:[UIImage imageNamed:@"LYStatusBarHUD.bundle/check.png"]];
}

// 显示错误信息
+ (void)showError:(NSString *)message {
    [self showMessage:message image:[UIImage imageNamed:@"LYStatusBarHUD.bundle/error.png"]];
}

// 显示正在加载
+ (void)loadingMessage:(NSString *)message {
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.font = LYMessageFont;
    label.frame = window_.frame;
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activity startAnimating];
    CGFloat msgW = [message sizeWithAttributes:@{NSFontAttributeName : LYMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    activity.center = CGPointMake(centerX, centerY);
    [window_ addSubview:activity];
}

// 隐藏
+ (void)hide {
    [UIView animateWithDuration:LYAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

// 显示普通信息
+ (void)showMessage:(NSString *)message {
    [self showMessage:message image:nil];
}

// 显示文字加图片
+ (void)showMessage:(NSString *)message image:(UIImage *)image {
    // 停止定时器
    [timer_ invalidate];
    
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = LYMessageFont;
    
    if (image != nil) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [button setImage:image forState:UIControlStateNormal];
    }
    
    [button setTitle:message forState:UIControlStateNormal];
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:LYMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

@end
