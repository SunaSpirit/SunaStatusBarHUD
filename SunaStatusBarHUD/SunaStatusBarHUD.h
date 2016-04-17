//
//  SunaStatusBarHUD.h
//  SunaStatusBarHUD
//
//  Created by Suna on 16/4/17.
//  Copyright © 2016年 Suna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SunaStatusBarHUD : UIView
/** 显示成功信息 */
+ (void)showSuccessWithMessage:(NSString *)msg;
/** 显示失败信息 */
+ (void)showErrorWithMessage:(NSString *)msg;
/** 显示加载中... */
+ (void)showLoadingWithMessage:(NSString *)msg;
/** 隐藏 */
+ (void)hiden;

@end
