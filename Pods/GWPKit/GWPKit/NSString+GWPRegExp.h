//
//  NSString+GWPRegExp.h
//  GWPKit
//
//  Created by GanWenPeng on 15/6/3.
//  Copyright (c) 2015年 GanWenPeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GWPRegExp)
/**
 *  正则匹配验证
 *
 *  @param pattern 正则表达式
 *
 *  @return 匹配结果
 */
- (BOOL)match:(NSString *)pattern;
/** 是否是数字（单个字） */
- (BOOL)isNumber;

/** 是否是字母（单个字） */
- (BOOL)isLetter;

/** 是否是QQ */
- (BOOL)isQQ;

/** 是否是手机号 */
- (BOOL)isMobileNumber;

/** 是否是邮箱 */
- (BOOL)isEmail;

/** 是否是身份证号 */
- (BOOL)isIDCard;

/** 是否是汉字(单个字) */
- (BOOL)isChinese;
@end
