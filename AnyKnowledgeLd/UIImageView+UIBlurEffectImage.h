//
//  UIImage+UIBlurEffectImage.h
//  AnyKnowledgeLd
//
//  Created by Lv on 16/7/5.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (UIBlurEffectImage)
/**
 *  毛玻璃
 *
 *  @param imageName imageName description
 *  @param alpha     alpha description
 *
 *  @return imageView
 */
+ (UIImageView *)getvisualEffectViewImage:(NSString *)imageName alpha:(CGFloat)alpha initWithFrame:(CGRect)rect;



@end
