//
//  GWPBaseCellModel.h
//  GWPKit
//
//  Created by GanWenPeng on 16/1/30.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GWPBaseCellModel : NSObject
/** 图标 */
@property (nonatomic, strong) UIImage   *image;
/** 标题 */
@property (nonatomic, copy)   NSString  *title;
/** 副标题 */
@property (nonatomic, copy)   NSString  *subTitle;
/** 占位文字 */
@property (nonatomic, copy)   NSString  *placeholder;
/** 点击后跳转到哪个控制器 */
@property (nonatomic, assign) Class     targetClass;
/** 点击后的操作（优先级高于TargetClass） */
@property (nonatomic, copy)   void      (^clickHandler)();

/**
 *  快速创建CampusHomeCellModel
 *
 *  @param image       图标
 *  @param title       标题文字
 *  @param subTitle    子标题文字/详情
 *  @param targetClass 点击后跳转的类
 *  @param clickHandler点击后的处理结果(优先级高于targetClass)
 *
 *  @return 实例化后的对象
 */
+ (instancetype)modelWithImage:(UIImage *)image
                         title:(NSString *)title
                      subTitle:(NSString *)subTitle
                   targetClass:(Class)targetClass
                  clickHandler:(void(^)())clickHandler;
@end
