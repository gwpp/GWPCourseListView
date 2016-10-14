//
//  GWPMacro.h
//  GWPKit
//
//  Created by GanWenPeng on 16/2/1.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#ifndef GWPMacro_h
#define GWPMacro_h

/** RGB颜色 */
#define GWPRGBColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
/** 随机色 */
#define GWPRandomColor GWPRGBColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255),1)


#endif /* GWPMacro_h */
