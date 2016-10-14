//
//  GWPUnderlineSegmentedControl.h
//  GWPKit
//
//  Created by GanWenPeng on 16/2/1.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GWPUnderlineSegmentedControl : UISegmentedControl
/** Width of underline */
@property (nonatomic, assign) CGFloat underlineWidth;

/** Set underline color for some state */
- (void)setUnderlineColor:(UIColor *)underlineColor forState:(UIControlState)state;

/** Set background color for some state */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
@end
