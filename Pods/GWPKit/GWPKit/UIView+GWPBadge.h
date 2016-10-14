//
//  UIView+GWPBadge.h
//  GWPKit
//
//  Created by GanWenPeng on 16/2/2.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GWPBadge)
- (void)showBadgeForRect:(CGRect)rect color:(UIColor *)color;

- (void)clearBadge;
@end
