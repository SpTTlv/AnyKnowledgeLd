//
//  UIImage+UIBlurEffectImage.m
//  AnyKnowledgeLd
//
//  Created by Lv on 16/7/5.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "UIImageView+UIBlurEffectImage.h"
@implementation UIImageView (UIBlurEffectImage)

+ (UIImageView *)getvisualEffectViewImage:(NSString *)imageName alpha:(CGFloat)alpha initWithFrame:(CGRect)rect
{
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    visualEffectView.alpha = alpha;
    UIImageView * imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageV.frame = rect;
    visualEffectView.frame = imageV.bounds;
    
    [imageV addSubview:visualEffectView];
    return imageV;
}

@end