//
//  GWPRightImageButton.m
//  GWPKit
//
//  Created by GanWenPeng on 16/2/1.
//  Copyright © 2016年 GanWenPeng. All rights reserved.
//

#import "GWPRightImageButton.h"
#import "UIView+GWPKit.h"

@implementation GWPRightImageButton
-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect imageFrame = [super imageRectForContentRect:contentRect];
    CGFloat imageWidth = imageFrame.size.width;
    CGRect titleRect = CGRectZero;
    titleRect.size = [[self titleForState:self.state] sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    switch(self.contentHorizontalAlignment) {
        case UIControlContentHorizontalAlignmentLeft:
            titleRect.origin.x = self.titleEdgeInsets.left - self.titleEdgeInsets.right;
            break;
        case UIControlContentHorizontalAlignmentRight:
            titleRect.origin.x = (self.frame.size.width - (titleRect.size.width + imageWidth)) - self.titleEdgeInsets.left + self.titleEdgeInsets.right;
            break;
        default:
            titleRect.origin.x = (self.frame.size.width - (titleRect.size.width + imageWidth)) / 2.0 + self.titleEdgeInsets.left - self.titleEdgeInsets.right;
    }
    
    imageFrame.origin.x = titleRect.origin.x + titleRect.size.width - self.imageEdgeInsets.right + self.imageEdgeInsets.left;
    return imageFrame;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat imageWidth = [self imageForState:self.state].size.width;
    CGRect titleFrame = [super titleRectForContentRect:contentRect];
    switch(self.contentHorizontalAlignment) {
        case UIControlContentHorizontalAlignmentLeft:
            titleFrame.origin.x = self.titleEdgeInsets.left - self.titleEdgeInsets.right;
            break;
        case UIControlContentHorizontalAlignmentRight:
            titleFrame.origin.x = (self.frame.size.width - (titleFrame.size.width + imageWidth)) - self.titleEdgeInsets.left + self.titleEdgeInsets.right;
            break;
        default:
            titleFrame.origin.x = (self.frame.size.width - (titleFrame.size.width + imageWidth)) / 2.0 + self.titleEdgeInsets.left - self.titleEdgeInsets.right;
    }
    return titleFrame;
}


- (void)setIsSizeToFit:(BOOL)isSizeToFit{
    _isSizeToFit = isSizeToFit;
    [self sizeToFit];
    [self layoutSubviews];
}
@end
