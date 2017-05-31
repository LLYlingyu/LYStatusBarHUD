//
//  LYStatusBarHUD.h
//  LYStatusBarHUD
//
//  Created by mac mini on 2017/5/31.
//  Copyright © 2017年 宁波力拓信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYStatusBarHUD : NSObject

// 显示成功信息
+ (void)showSuccess:(NSString *)message;

// 显示错误信息
+ (void)showError:(NSString *)message;

// 显示正在加载
+ (void)loadingMessage:(NSString *)message;

// 隐藏
+ (void)hide;

// 显示普通信息
+ (void)showMessage:(NSString *)message;

// 显示文字加图片
+ (void)showMessage:(NSString *)message image:(UIImage *)image;

@end
