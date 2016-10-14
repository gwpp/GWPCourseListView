//
//  UIImage+GWPKit.m
//  GWPKit
//
//  Created by GanWenPeng on 15-5-13.
//  Copyright (c) 2015年 GanWenPeng. All rights reserved.
//

#import "UIImage+GWPKit.h"

@implementation UIImage (GWPKit)
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        
        NSLog(@"scale image fail");
    }
    UIGraphicsEndImageContext();
    return newImage;
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (instancetype)cutImageWithRect:(CGRect)rect{
    CGRect drawRect = CGRectMake(-rect.origin.x , -rect.origin.y, self.size.width, self.size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
    
    [self drawInRect:drawRect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
- (instancetype)circleWithBoardWidth:(CGFloat)boardWidth boardColor:(UIColor *)boardColor{
    // 开启图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width + boardWidth*2, self.size.height + boardWidth*2), NO, 0.0);
    
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画大圆(裁剪路径，这个图形是什么样子，裁剪后的图像的边框就是什么样子)
    [boardColor set];
    CGRect outsideCircle = CGRectMake(0, 0, self.size.width + boardWidth*2, self.size.height + boardWidth*2);
    CGContextAddEllipseInRect(ctx, outsideCircle);
    // 输出大圆
    CGContextFillPath(ctx);
    
    // 画圆(裁剪路径，这个图形是什么样子，裁剪后的图像就是什么样子)
    CGRect insideCircle = CGRectMake(boardWidth, boardWidth, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, insideCircle);
    
    
    
    // 裁剪
    CGContextClip(ctx);
    
    // 将原图画上去
    [self drawInRect:insideCircle];
    
    // 获取新图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype)circleWithImageName:(NSString *)name boardWidth:(CGFloat)boardWidth boardColor:(UIColor *)boardColor{
    UIImage *image = [UIImage imageNamed:name];
    return [image circleWithBoardWidth:boardWidth boardColor:boardColor];
}

- (instancetype)roundRectWithRadius:(CGFloat)radius{
    UIImage *icon = self;
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(icon.size, NO, 0.0);
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画裁剪路径
    CGContextAddArc(ctx, radius, radius, radius, -M_PI_2, M_PI, 1);      // 左上角弧线
    CGContextAddLineToPoint(ctx, 0, icon.size.height-radius);           // 左线
    CGContextAddArc(ctx, radius, icon.size.height-radius, radius, M_PI, M_PI_2, 1);       // 左下角弧线
    CGContextAddLineToPoint(ctx, icon.size.width-radius, icon.size.height);                 // 下线
    CGContextAddArc(ctx, icon.size.width-radius, icon.size.height-radius, radius, M_PI_2, 0, 1);    // 右下角弧线
    CGContextAddLineToPoint(ctx, icon.size.width, radius);              // 右线
    CGContextAddArc(ctx, icon.size.width-radius, radius, radius, 0, -M_PI_2, 1);     // 右下角弧线
    CGContextClosePath(ctx);
    
    
    
    
    CGContextClip(ctx);
    
    [icon drawInRect:CGRectMake(0, 0, icon.size.width, icon.size.height)];
    
    UIImage *new = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return new;
    
}
+ (instancetype)roundRectWithName:(NSString *)name radius:(CGFloat)radius{
    UIImage *image = [UIImage imageNamed:name];
    return [image roundRectWithRadius:radius];
}

- (instancetype)resizeableImage{
    UIImage *img = self;
    CGFloat w = img.size.width/2;
    CGFloat h = img.size.height/2;
    return [img stretchableImageWithLeftCapWidth:w topCapHeight:h];
}


- (instancetype)expansionWithBackground:(UIColor *)bgColor newSize:(CGSize)size{
    UIImage *image = self;
    // 开启图形上下文
    UIGraphicsBeginImageContext(size);
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 设置背景色
    [bgColor set];
    
    // 画出背景矩形
    CGContextAddRect(ctx, CGRectMake(0, 0, size.width, size.height));
    
    // 渲染
    CGContextFillPath(ctx);
    
    // 无拉伸的将图片画上去
    CGFloat imgX = (size.width - image.size.width)/2;
    CGFloat imgY = (size.height - image.size.height)/2;
    [image drawInRect:CGRectMake(imgX, imgY, image.size.width, image.size.height)];
    
    // 取出图形上下文中的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    // 返回处理后的图片
    return newImage;
}



+ (instancetype)captureWithView:(UIView *)view{
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    // 将self.view.layer渲染到上下文中
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 取出上下文中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    // 返回
    return image;
}


- (instancetype)waterImage:(UIImage *)waterImage anGWPLogoScale:(CGFloat)scale{
    UIImage *bgImage = self;
    // 获取上下文
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    // 画背景大图
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 画Logo
    UIImage *logo = waterImage;
    
    CGFloat margin = 5;
    CGFloat logoW = logo.size.width * scale;
    CGFloat logoH = logo.size.height * scale;
    CGFloat logoX = bgImage.size.width - logoW - margin;
    CGFloat logoY = bgImage.size.height - logoH - margin;
    [logo drawInRect:CGRectMake(logoX, logoY, logoW, logoH)];
    
    // 从上下文中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype)waterImageWithBackgroundImage:(UIImage *)bgImage andText:(NSString *)text andTextAttributes:(NSDictionary *)attributes{
    // 获取上下文
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    // 画背景大图
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 画text
    CGFloat margin = 5;
    // size是允许的最大宽度高度
    CGSize maxSize = CGSizeMake(bgImage.size.width-2*margin, bgImage.size.height-2*margin);
    // attrs是字体属性
    NSDictionary *attrs = attributes;
    // 计算字符串宽度高度的函数
    CGSize textSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    CGFloat textX = bgImage.size.width - textSize.width - margin;
    CGFloat textY = bgImage.size.height - textSize.height - margin;
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    CGRect textRect = CGRectMake(textX, textY, textW, textH);
    [text drawInRect:textRect withAttributes:attrs];
    
    // 从上下文中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
