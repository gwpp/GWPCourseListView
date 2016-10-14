//
//  UIImageView+GWPWebCache.m
//  GWPKit
//
//  Created by GanWenPeng on 16/2/14.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import "UIImageView+GWPWebCache.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (GWPWebCache)
- (void)gwp_setImageWithURL:(nonnull NSURL *)url{
    [self sd_setImageWithURL:url];
    [self sd_setImageWithURL:url placeholderImage:nil options:SDWebImageRetryFailed |
     SDWebImageLowPriority | SDWebImageProgressiveDownload | SDWebImageContinueInBackground];
    
}

- (void)gwp_setImageWithURL:(nonnull NSURL *)url
           placeholderImage:(nullable UIImage *)placeholderImage{
    [self sd_setImageWithURL:url placeholderImage:placeholderImage options:SDWebImageRetryFailed |
     SDWebImageLowPriority | SDWebImageProgressiveDownload | SDWebImageContinueInBackground];
}
@end
