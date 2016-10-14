//
//  GWPDeviceModel.m
//  GWPKit
//
//  Created by GanWenPeng on 15/10/9.
//  Copyright © 2015年 GanWenPeng. All rights reserved.
//

#import "GWPDeviceModel.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@implementation GWPDeviceModel
+ (BOOL)is_iPad{
    return [self deviceSizeEqualTo:iPad_Size];
}
+ (BOOL)is_iPhone{
    return [self is_iPhone4] || [self is_iPhone5] || [self is_iPhone6] || [self is_iPhone6Plus];
}
+ (BOOL)is_iPhone4{
    return [self deviceSizeEqualTo:iPhone4_Size];
}
+ (BOOL)is_iPhone5{
    return [self deviceSizeEqualTo:iPhone5_Size];
}
+ (BOOL)is_iPhone6{
    return [self deviceSizeEqualTo:iPhone6_Size];
}
+ (BOOL)is_iPhone6Plus{
    return [self deviceSizeEqualTo:iPhone6Plsu_Size];
}

+ (BOOL)deviceSizeEqualTo:(CGSize)size{
    return(DeviceSize.height==size.height && DeviceSize.width==size.width) || (DeviceSize.height==size.width && DeviceSize.width==size.height);
}
@end
