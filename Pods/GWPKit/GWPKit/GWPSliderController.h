//
//  GWPSliderController.h
//  GWPKit
//
//  Created by GanWenPeng on 15/7/7.
//  Copyright (c) 2015年 GanWenPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SliderType) {
    SliderType1 = 1,
    SliderType2 = 2
};

@interface GWPSliderController : UIViewController

@property (nonatomic, strong) UIViewController *centerVc;
@property (nonatomic, strong) UIViewController *leftVc;
@property (nonatomic, strong) UIViewController *rightVc;

/** 蒙版遮盖层 */
@property (nonatomic, weak) UIButton *cover;

@property (nonatomic, assign) BOOL is_leftShow;
@property (nonatomic, assign) BOOL is_rightShow;


/** 左侧栏宽度 */
@property (nonatomic, assign) CGFloat leftWidth;
/** 右侧栏宽度 */
@property (nonatomic, assign) CGFloat rightWidth;
/** 动画时间 */
@property (nonatomic, assign) NSTimeInterval transformTime;
/** 左侧栏左滑时关闭边栏 */
@property (nonatomic, assign) BOOL resetWhenLeftViewSwipeToLeft;
/** 右侧栏右滑时关闭边栏 */
@property (nonatomic, assign) BOOL resetWhenRightViewSwipeToRight;
/** Center左滑显示右边 */
@property (nonatomic, assign) BOOL showLeftWhenCenterSwipeToRight;
/** Center右滑显示左边 */
@property (nonatomic, assign) BOOL showRightWhenCenterSwipeToLeft;
/** Slider类型 */
@property (nonatomic, assign) SliderType type;

/** 快速创建 */
+ (instancetype)sliderControllerWithCenterVc:(UIViewController *)centerVc leftVc:(UIViewController *)leftVc rightVc:(UIViewController *)rightVc type:(SliderType)type;
/** 显示左侧栏 */
- (void)showLeft;
/** 显示右侧栏 */
- (void)showRight;
/** 界面重置，各控制器视图回归原位 */
- (void)resetEveryView;

@end
