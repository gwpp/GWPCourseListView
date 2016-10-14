//
//  UIButton+GWPWebCache.h
//  GWPKit
//
//  Created by GanWenPeng on 16/2/14.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (GWPWebCache)
/**
 *  加载按钮对应状态的图片
 *
 *  @param url   图片URL
 *  @param state 按钮状态
 */
- (void)gwp_setImageWithURL:(nonnull NSURL *)url
                   forState:(UIControlState)state;

/**
 *  加载按钮对应状态的图片（带占位图片）
 *
 *  @param url              图片URL
 *  @param state            按钮状态
 *  @param placeholderImage 占位图片
 */
- (void)gwp_setImageWithURL:(nonnull NSURL *)url
                   forState:(UIControlState)state
           placeholderImage:(nullable UIImage *)placeholderImage;


/**
 *  加载按钮背景图片
 *
 *  @param url   图片URL
 *  @param state 状态
 */
- (void)gwp_setBackgroundImageWithURL:(nonnull NSURL *)url
                             forState:(UIControlState)state;


/**
 *  加载按钮背景图片
 *
 *  @param url   图片URL
 *  @param state 状态
 *  @param placeholderImage 占位图片
 */
- (void)gwp_setBackgroundImageWithURL:(nonnull NSURL *)url
                             forState:(UIControlState)state
                     placeholderImage:(nullable UIImage *)placeholderImage;



@end
