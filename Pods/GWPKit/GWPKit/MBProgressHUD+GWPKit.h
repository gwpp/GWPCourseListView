//
//  MBProgressHUD+GWPKit.h
//  GWPKit
//
//  Created by GanWenPeng on 15-4-18.
//  Copyright (c) 2015年 GanWenPeng. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (GWPKit)
+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success completion:(MBProgressHUDCompletionBlock)completion;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view completion:(MBProgressHUDCompletionBlock)completion;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error completion:(MBProgressHUDCompletionBlock)completion;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view completion:(MBProgressHUDCompletionBlock)completion;

+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSString *)message withCover:(BOOL)cover;
+ (void)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showMessage:(NSString *)message toView:(UIView *)view withCover:(BOOL)cover;

+ (MBProgressHUD *)showLoadingMessage:(NSString *)message;
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message withCover:(BOOL)cover;
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message toView:(UIView *)view withCover:(BOOL)cover;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
