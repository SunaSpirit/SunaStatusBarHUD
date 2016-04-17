//
//  ViewController.m
//  SunaStatusBarHUDDemo
//
//  Created by Suna on 16/4/17.
//  Copyright © 2016年 Suna. All rights reserved.
//

#import "ViewController.h"
#import "SunaStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success
{
    [SunaStatusBarHUD showSuccessWithMessage:@"加载成功"];
}
- (IBAction)error
{
    [SunaStatusBarHUD showErrorWithMessage:@"加载失败"];
}
- (IBAction)loading
{
    [SunaStatusBarHUD showLoadingWithMessage:@"加载中..."];
}
- (IBAction)hiden
{
    [SunaStatusBarHUD hiden];
}

@end
