//
//  ViewController.m
//  LYStatusBarHUDExample
//
//  Created by mac mini on 2017/5/31.
//  Copyright © 2017年 宁波力拓信息科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "LYStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(id)sender {
    [LYStatusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)error:(id)sender {
    [LYStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading:(id)sender {
    [LYStatusBarHUD loadingMessage:@"正在加载..."];
}

- (IBAction)hide:(id)sender {
    [LYStatusBarHUD hide];
}

- (IBAction)normalMessage:(id)sender {
    [LYStatusBarHUD showMessage:@"加载"];
}

@end
