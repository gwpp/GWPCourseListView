//
//  GWPUnderlineSegmentedControl.m
//  GWPKit
//
//  Created by GanWenPeng on 16/2/1.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import "GWPUnderlineSegmentedControl.h"
#import "UIView+GWPKit.h"
#import "GWPLog.h"

@interface GWPUnderlineSegmentedControl ()

// underline color of item
@property (nonatomic, strong) UIColor *normalUnderlineColor;
@property (nonatomic, strong) UIColor *selectedUnderlineColor;
@property (nonatomic, strong) UIColor *highlightUnderlineColor;
@property (nonatomic, strong) UIColor *disableUnderlineColor;

// background color of item
@property (nonatomic, strong) UIColor *normalBackgroundColor;
@property (nonatomic, strong) UIColor *selectedBackgroundColor;
@property (nonatomic, strong) UIColor *highlightBackgroundColor;
@property (nonatomic, strong) UIColor *disableBackgroundColor;

@property (nonatomic, weak)   UIView  *defaultUnderline;

@property (nonatomic, assign) BOOL    layoutting;
@end

@implementation GWPUnderlineSegmentedControl

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.tintColor = [UIColor clearColor];
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.borderWidth = 0;
    self.underlineWidth = 2;
    
    UIView *under = [[UIView alloc] init];
    [self insertSubview:under atIndex:0];
    self.defaultUnderline = under;
}

- (void)setTintColor:(UIColor *)tintColor{
    [super setTintColor:[UIColor clearColor]];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    switch (state) {
        case UIControlStateNormal:
            self.normalBackgroundColor = backgroundColor;
            break;
            
        case UIControlStateSelected:
            self.selectedBackgroundColor = backgroundColor;
            break;
            
        case UIControlStateDisabled:
            self.disableBackgroundColor = backgroundColor;
            break;
            
        case UIControlStateHighlighted:
            self.highlightBackgroundColor = backgroundColor;
            break;
            
        default:
            break;
    }
}

- (void)setUnderlineColor:(UIColor *)underlineColor forState:(UIControlState)state{
    switch (state) {
        case UIControlStateNormal:
            self.normalUnderlineColor = underlineColor;
            break;
            
        case UIControlStateSelected:
            self.selectedUnderlineColor = underlineColor;
            break;
            
        case UIControlStateDisabled:
            self.disableUnderlineColor = underlineColor;
            break;
            
        case UIControlStateHighlighted:
            self.highlightUnderlineColor = underlineColor;
            break;
            
        default:
            break;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    LogMethod
    
    if (self.layoutting==YES) {
        return;
    }
    
    self.layoutting = YES;
    UIImage *image;
    
    image = [self imageWithUnderlineColor:self.normalUnderlineColor backgroundColor:self.normalBackgroundColor];
    [self setBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self setDividerImage:image forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self setDividerImage:image forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self setDividerImage:image forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

    image = [self imageWithUnderlineColor:self.selectedUnderlineColor backgroundColor:self.selectedBackgroundColor];
    [self setBackgroundImage:image forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];

    image = [self imageWithUnderlineColor:self.highlightUnderlineColor backgroundColor:self.highlightBackgroundColor];
    [self setBackgroundImage:image forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];

    image = [self imageWithUnderlineColor:self.disableUnderlineColor backgroundColor:self.disableBackgroundColor];
    [self setBackgroundImage:image forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];

    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.layoutting = NO;
    });
    
//    self.defaultUnderline.backgroundColor = self.normalUnderlineColor;
//    self.frame = CGRectMake(0, self.height-self.underlineWidth, self.width, self.underlineWidth);
}

- (UIImage *)imageWithUnderlineColor:(UIColor *)underlineColor backgroundColor:(UIColor *)backgroundColor{
    // open image context
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, self.height), NO, 0.0);
    
    // get current context
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // set underline color
    [underlineColor ? underlineColor : [UIColor clearColor] set];
    
    // draw underline
    CGFloat underlineW = self.underlineWidth;
    CGRect underline = CGRectMake(0, self.height-underlineW, 1, underlineW);
    CGContextAddRect(ctx, underline);
    
    // output underline
    CGContextFillPath(ctx);
    
    
    
    // set underline color
    [backgroundColor ? backgroundColor : [UIColor clearColor] set];
    
    // draw backgroundColor
    CGContextAddRect(ctx, CGRectMake(0, 0, 1, self.height-underlineW));
    
    // output underline
    CGContextFillPath(ctx);
    
    
    
    // return
    return UIGraphicsGetImageFromCurrentImageContext();
    
}

- (void)setUnderlineWidth:(CGFloat)underlineWidth{
    _underlineWidth = underlineWidth;
    
    [self layoutIfNeeded];
}

@end
