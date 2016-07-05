//
//  UIImage+GsImage.h
//  AnyKnowledgeLd
//
//  Created by Lv on 16/7/5.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GsImage)

/**
 *  高斯模糊
 *
 *  @param image image description
 *  @param blur  blur description
 *
 *  @return image
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

@end
