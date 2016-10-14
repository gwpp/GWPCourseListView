//
//  GWPBaseCellModel.m
//  GWPKit
//
//  Created by GanWenPeng on 16/1/30.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import "GWPBaseCellModel.h"

@implementation GWPBaseCellModel
+ (instancetype)modelWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle targetClass:(__unsafe_unretained Class)targetClass clickHandler:(void (^)())clickHandler{
    GWPBaseCellModel *model = [[self alloc] init];
    model.image = image;
    model.title = title;
    model.subTitle = subTitle;
    model.targetClass = targetClass;
    model.clickHandler = clickHandler;
    return model;
}
@end
