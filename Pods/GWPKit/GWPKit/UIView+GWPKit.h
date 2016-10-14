//
//  UIView+GWPKit.h
//  GWPKit
//
//  Created by GanWenPeng on 15-4-17.
//  Copyright (c) 2015年 GanWenPeng. All rights reserved.
//


// 用于直接修改继承自UIView的控件的x,y,width,height,size,origin,centerX,centerY等值，而不需要先获取frame在进行修改


#import <UIKit/UIKit.h>

@interface UIView (GWPKit)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;

/**
 *  给UIView设置某种颜色的虚线边框，宽度1px
 *
 */
- (void)dashedBorderWithColor:(UIColor *)color;
@end
