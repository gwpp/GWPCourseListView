//
//  NSString+GWPRegExp.m
//  GWPKit
//
//  Created by GanWenPeng on 15/6/3.
//  Copyright (c) 2015年 GanWenPeng. All rights reserved.
//

#import "NSString+GWPRegExp.h"

@implementation NSString (GWPRegExp)
- (BOOL)match:(NSString *)pattern{
    
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:NULL];
    NSArray *res = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return res.count==1;
}

- (BOOL)isNumber{
    return [self match:@"\\d"];
}

- (BOOL)isLetter{
    return [self match:@"[a-zA-Z]"];
}

- (BOOL)isQQ{
    return [self match:@"^[1-9]\\d{4,10}$"];
}

- (BOOL)isMobileNumber{
    return [self match:@"^1[3|4|5|7|8][0-9]\\d{8}$"];
}


- (BOOL)isEmail{
    return [self match:@"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"];
}

- (BOOL)isIDCard{
//    return [self match:@"^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$"];
    // 只支持18位身份证号码
    return [self match:@"^\\d{6}(18|19|20)\\d{2}(0[1-9]|1[12])(0[1-9]|[12]\\d|3[01])\\d{3}(\\d|[Xx])$"];
}

- (BOOL)isChinese{
    return [self match:@"[\\u4e00-\\u9fa5]"];
}
@end
