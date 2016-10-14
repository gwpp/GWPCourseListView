//
//  GWPLog.h
//  GWPKit
//
//  Created by GanWenPeng on 15/7/4.
//  Copyright (c) 2015年 GanWenPeng. All rights reserved.
//

#ifdef DEBUG
#define LogMethod \
    NSLog(@"method:%s  line:%d\n---------------------------", __func__, __LINE__);

#define GWPLog(...) \
    NSLog(@"\nmethod\t:\t%s  \nline\t:\t%d \nlog\t:\t%@\n---------------------------", __func__, __LINE__, [NSString stringWithFormat:__VA_ARGS__]);

#define LogRect(rect) \
    GWPLog(@"x:%f,y:%f,w:%f,h:%f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);

#define LogSize(size) \
    GWPLog(@"w:%f,h:%f",(size).width,(size).height);

#define LogPoint(point) \
    GWPLog(@"x:%f,y:%f",point.x,point.y);
#else   // DEBUG
#define LogMethod
#define GWPLog(...)
#define LogRect(rect)
#define LogSize(size)
#define LogPoint
#endif // DEBUG