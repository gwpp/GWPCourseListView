//
//  UIView+GWPKit.m
//  GWPKit
//
//  Created by GanWenPeng on 15-4-17.
//  Copyright (c) 2015年 GanWenPeng. All rights reserved.
//

#import "UIView+GWPKit.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (GWPKit)
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX{
    return self.center.x;
}


- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY{
    return self.center.y;
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin{
    return self.frame.origin;
}
- (void)dashedBorderWithColor:(UIColor *)color{
    CGFloat radius = self.layer.cornerRadius;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //    [shapeLayer setBounds:self.bounds];
    [shapeLayer setPosition:CGPointZero];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    // 设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[color CGColor]];
    
    // 3.0f设置虚线的宽度
    [shapeLayer setLineWidth:1.0f];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    // 3=线的宽度 1=每条线的间距
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
      [NSNumber numberWithInt:5],nil]];
    
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    if (radius==0) {
        CGPathAddRect(path, NULL, CGRectMake(0, 0, self.width, self.height));
    } else {
        CGPathMoveToPoint(path, NULL, radius, 0);
        CGPathAddLineToPoint(path, NULL, self.width-radius, 0);
        CGPathAddArc(path, NULL, self.width-radius, radius, radius, M_PI_2*3, 0, NO);
        CGPathAddLineToPoint(path, NULL, self.width, self.height-radius);
        CGPathAddArc(path, NULL, self.width-radius, self.height-radius, radius, 0, M_PI_2, NO);
        CGPathAddLineToPoint(path, NULL, radius, self.height);
        CGPathAddArc(path, NULL, radius, self.height-radius, radius, M_PI_2, -M_PI, NO);
        CGPathAddLineToPoint(path, NULL, 0, radius);
        CGPathAddArc(path, NULL, radius, radius, radius, M_PI, M_PI_2*3, NO);
    }
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
    [[self layer] addSublayer:shapeLayer];
    
    
}

@end
