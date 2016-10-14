//
//  UIView+GWPBadge.m
//  GWPKit
//
//  Created by GanWenPeng on 16/2/2.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import "UIView+GWPBadge.h"

@implementation UIView (GWPBadge)

static UIView *_gwp_badge;

- (void)showBadgeForRect:(CGRect)rect color:(UIColor *)color{
    if (!_gwp_badge) {
        _gwp_badge = [[UIView alloc] init];
    }
    
    UIView *badge = _gwp_badge;
    badge.layer.cornerRadius = MIN(rect.size.width, rect.size.height)/2;
    badge.clipsToBounds = YES;
    badge.backgroundColor = color;
    _gwp_badge = badge;
    [self addSubview:badge];
    badge.frame = rect;
}

-  (void)clearBadge{
    if (_gwp_badge) {
        [_gwp_badge removeFromSuperview];
        _gwp_badge = nil;
    }
}
@end
