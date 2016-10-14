//
//  GWPGIFView.h
//  GWPKit
//
//  Created by GanWenPeng on 16/1/20.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface GWPGIFView : UIView{
    CGImageSourceRef gif; // 保存gif动画
    NSDictionary *gifProperties;  // 保存gif动画属性
    size_t index;// gif动画播放开始的帧序号
    size_t count;// gif动画的总帧数
    NSTimer *timer;// 播放gif动画所使用的timer
}

- (id)initWithFrame:(CGRect)frame filePath:(NSString *)_filePath;
- (id)initWithFrame:(CGRect)frame data:(NSData *)_data;
- (void)stopGif;
@end
