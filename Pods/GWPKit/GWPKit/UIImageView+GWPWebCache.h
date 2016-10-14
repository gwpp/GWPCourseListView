//
//  UIImageView+GWPWebCache.h
//  GWPKit
//
//  Created by GanWenPeng on 16/2/14.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (GWPWebCache)
/**
 *  加载网络图片
 *
 *  @param url 图片URL
 */
- (void)gwp_setImageWithURL:(nonnull NSURL *)url;

/**
 *  加载网络图片（带展位图）
 *
 *  @param url              图片URL
 *  @param placeholderImage 占位图片
 */
- (void)gwp_setImageWithURL:(nonnull NSURL *)url
           placeholderImage:(nullable UIImage *)placeholderImage;

@end
