//
//  SunaStatusBarHUD.m
//  SunaStatusBarHUD
//
//  Created by Suna on 16/4/17.
//  Copyright © 2016年 Suna. All rights reserved.
//

#import "SunaStatusBarHUD.h"

/** 字体 */
#define SunaTitleFont [UIFont systemFontOfSize:13]
/** 屏幕宽度 */
#define SunaScreenWidth [UIScreen mainScreen].bounds.size.width

static CGFloat const SunaStatusBarHeight = 20;

@implementation SunaStatusBarHUD

static UIWindow *window_;
static NSTimer *_timer;

+ (void)setupWindow
{
    window_.hidden = YES;
    
    window_ = [[UIWindow alloc] init];
    window_.frame = CGRectMake(0, - SunaStatusBarHeight, SunaScreenWidth, SunaStatusBarHeight);
    window_.backgroundColor = [UIColor greenColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
}

+ (void)showStatusWithImage:(NSString *)imageStr message:(NSString *)msg
{
    // 移除定时器
    [_timer invalidate];
    _timer = nil;
    
    [self setupWindow];
    // 按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = window_.bounds;
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = SunaTitleFont;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

    if (!imageStr) { // 菊花
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        CGPoint center = indicator.center;
        CGSize titleSize = [btn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:SunaTitleFont}];
        center.x = (SunaScreenWidth - titleSize.width) / 2 - 10;
        center.y = btn.frame.size.height / 2;
        indicator.center = center;
        [indicator startAnimating];
        [btn addSubview:indicator];
    } else {
        // 添加定时器
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hiden) userInfo:nil repeats:NO];
    }
    
    [window_ addSubview:btn];
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        window_.transform = CGAffineTransformMakeTranslation(0, SunaStatusBarHeight);
    }];
    
    
}


+ (void)showSuccessWithMessage:(NSString *)msg;
{
    [self showStatusWithImage:@"SunaStatusBarHUD.bundle/success.png" message:msg];
}

+ (void)showErrorWithMessage:(NSString *)msg
{
    [self showStatusWithImage:@"SunaStatusBarHUD.bundle/error.png" message:msg];
}

+ (void)showLoadingWithMessage:(NSString *)msg
{
    
    // 按钮
    [self showStatusWithImage:nil message:msg];
}

+ (void)hiden
{
    [UIView animateWithDuration:0.25 animations:^{
        window_.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        window_.hidden = YES;
        window_ = nil;
    }];
    
    [_timer invalidate];
    _timer = nil;
}

@end
