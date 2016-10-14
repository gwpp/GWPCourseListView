//
//  UIButton+GWPWebCache.m
//  GWPKit
//
//  Created by GanWenPeng on 16/2/14.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import "UIButton+GWPWebCache.h"
#import <SDWebImage/UIButton+WebCache.h>

@implementation UIButton (GWPWebCache)
- (void)gwp_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state{
    [self sd_setBackgroundImageWithURL:url forState:state];
}

- (void)gwp_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholderImage{
    
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholderImage];
}

- (void)gwp_setImageWithURL:(NSURL *)url forState:(UIControlState)state{
    [self sd_setImageWithURL:url forState:state];
}

- (void)gwp_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholderImage{
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholderImage];
}
@end
